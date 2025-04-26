#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_pattern "../tv/cdatafile/c.kmp.autotvin_pattern.dat"
#define AUTOTB_TVOUT_pattern "../tv/cdatafile/c.kmp.autotvout_pattern.dat"
// wrapc file define:
#define AUTOTB_TVIN_input "../tv/cdatafile/c.kmp.autotvin_input_r.dat"
#define AUTOTB_TVOUT_input "../tv/cdatafile/c.kmp.autotvout_input_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_kmpNext "../tv/cdatafile/c.kmp.autotvin_kmpNext.dat"
#define AUTOTB_TVOUT_kmpNext "../tv/cdatafile/c.kmp.autotvout_kmpNext.dat"
// wrapc file define:
#define AUTOTB_TVIN_n_matches "../tv/cdatafile/c.kmp.autotvin_n_matches.dat"
#define AUTOTB_TVOUT_n_matches "../tv/cdatafile/c.kmp.autotvout_n_matches.dat"
// wrapc file define:
#define AUTOTB_TVOUT_return "../tv/cdatafile/c.kmp.autotvout_ap_return.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_pattern "../tv/rtldatafile/rtl.kmp.autotvout_pattern.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_input "../tv/rtldatafile/rtl.kmp.autotvout_input_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_kmpNext "../tv/rtldatafile/rtl.kmp.autotvout_kmpNext.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_n_matches "../tv/rtldatafile/rtl.kmp.autotvout_n_matches.dat"
#define AUTOTB_TVOUT_PC_return "../tv/rtldatafile/rtl.kmp.autotvout_ap_return.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  pattern_depth = 0;
  input_depth = 0;
  kmpNext_depth = 0;
  n_matches_depth = 0;
  return_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{pattern " << pattern_depth << "}\n";
  total_list << "{input_r " << input_depth << "}\n";
  total_list << "{kmpNext " << kmpNext_depth << "}\n";
  total_list << "{n_matches " << n_matches_depth << "}\n";
  total_list << "{ap_return " << return_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int pattern_depth;
    int input_depth;
    int kmpNext_depth;
    int n_matches_depth;
    int return_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" int kmp_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" int apatb_kmp_hw(volatile void * __xlx_apatb_param_pattern, volatile void * __xlx_apatb_param_input, volatile void * __xlx_apatb_param_kmpNext, volatile void * __xlx_apatb_param_n_matches) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
    int AESL_return;
    {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_return);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > return_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "return");
  
            // push token into output port buffer
            if (AESL_token != "") {
              return_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {
            ((int*)&AESL_return)[0] = return_pc_buffer[0].to_int64();
          }
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_kmpNext);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > kmpNext_pc_buffer(4);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "kmpNext");
  
            // push token into output port buffer
            if (AESL_token != "") {
              kmpNext_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 4; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_kmpNext)[j] = kmpNext_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_n_matches);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > n_matches_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "n_matches");
  
            // push token into output port buffer
            if (AESL_token != "") {
              n_matches_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 1; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_n_matches)[j] = n_matches_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return  AESL_return;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//pattern
aesl_fh.touch(AUTOTB_TVIN_pattern);
aesl_fh.touch(AUTOTB_TVOUT_pattern);
//input
aesl_fh.touch(AUTOTB_TVIN_input);
aesl_fh.touch(AUTOTB_TVOUT_input);
//kmpNext
aesl_fh.touch(AUTOTB_TVIN_kmpNext);
aesl_fh.touch(AUTOTB_TVOUT_kmpNext);
//n_matches
aesl_fh.touch(AUTOTB_TVIN_n_matches);
aesl_fh.touch(AUTOTB_TVOUT_n_matches);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_pattern = 0;
// print pattern Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_pattern, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_pattern = 0*1;
  if (__xlx_apatb_param_pattern) {
    for (int j = 0  - 0, e = 4 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_pattern)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_pattern, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(4, &tcl_file.pattern_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_pattern, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_input = 0;
// print input Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_input, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_input = 0*1;
  if (__xlx_apatb_param_input) {
    for (int j = 0  - 0, e = 32411 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_input)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_input, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(32411, &tcl_file.input_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_input, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_kmpNext = 0;
// print kmpNext Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_kmpNext, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_kmpNext = 0*4;
  if (__xlx_apatb_param_kmpNext) {
    for (int j = 0  - 0, e = 4 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_kmpNext)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_kmpNext, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(4, &tcl_file.kmpNext_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_kmpNext, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_n_matches = 0;
// print n_matches Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_n_matches, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_n_matches = 0*4;
  if (__xlx_apatb_param_n_matches) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_n_matches)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_n_matches, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(1, &tcl_file.n_matches_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_n_matches, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
int ap_return = kmp_hw_stub_wrapper(__xlx_apatb_param_pattern, __xlx_apatb_param_input, __xlx_apatb_param_kmpNext, __xlx_apatb_param_n_matches);
CodeState = DUMP_OUTPUTS;
// print kmpNext Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_kmpNext, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_kmpNext = 0*4;
  if (__xlx_apatb_param_kmpNext) {
    for (int j = 0  - 0, e = 4 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_kmpNext)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_kmpNext, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(4, &tcl_file.kmpNext_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_kmpNext, __xlx_sprintf_buffer.data());
}
// print n_matches Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_n_matches, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_n_matches = 0*4;
  if (__xlx_apatb_param_n_matches) {
    for (int j = 0  - 0, e = 1 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_n_matches)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_n_matches, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(1, &tcl_file.n_matches_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_n_matches, __xlx_sprintf_buffer.data());
}
// print return Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_return, __xlx_sprintf_buffer.data());
  sc_bv<32> __xlx_tmp_lv = ((int*)&ap_return)[0];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_return, __xlx_sprintf_buffer.data()); 
  
  tcl_file.set_num(1, &tcl_file.return_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_return, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
return ap_return;
}
