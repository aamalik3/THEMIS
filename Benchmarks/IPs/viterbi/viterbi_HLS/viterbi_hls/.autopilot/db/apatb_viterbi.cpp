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
#define AUTOTB_TVIN_obs "../tv/cdatafile/c.viterbi.autotvin_obs.dat"
#define AUTOTB_TVOUT_obs "../tv/cdatafile/c.viterbi.autotvout_obs.dat"
// wrapc file define:
#define AUTOTB_TVIN_init "../tv/cdatafile/c.viterbi.autotvin_init.dat"
#define AUTOTB_TVOUT_init "../tv/cdatafile/c.viterbi.autotvout_init.dat"
// wrapc file define:
#define AUTOTB_TVIN_transition "../tv/cdatafile/c.viterbi.autotvin_transition.dat"
#define AUTOTB_TVOUT_transition "../tv/cdatafile/c.viterbi.autotvout_transition.dat"
// wrapc file define:
#define AUTOTB_TVIN_emission "../tv/cdatafile/c.viterbi.autotvin_emission.dat"
#define AUTOTB_TVOUT_emission "../tv/cdatafile/c.viterbi.autotvout_emission.dat"
// wrapc file define:
#define AUTOTB_TVIN_path "../tv/cdatafile/c.viterbi.autotvin_path.dat"
#define AUTOTB_TVOUT_path "../tv/cdatafile/c.viterbi.autotvout_path.dat"
// wrapc file define:
#define AUTOTB_TVOUT_return "../tv/cdatafile/c.viterbi.autotvout_ap_return.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_obs "../tv/rtldatafile/rtl.viterbi.autotvout_obs.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_init "../tv/rtldatafile/rtl.viterbi.autotvout_init.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_transition "../tv/rtldatafile/rtl.viterbi.autotvout_transition.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_emission "../tv/rtldatafile/rtl.viterbi.autotvout_emission.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_path "../tv/rtldatafile/rtl.viterbi.autotvout_path.dat"
#define AUTOTB_TVOUT_PC_return "../tv/rtldatafile/rtl.viterbi.autotvout_ap_return.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  obs_depth = 0;
  init_depth = 0;
  transition_depth = 0;
  emission_depth = 0;
  path_depth = 0;
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
  total_list << "{obs " << obs_depth << "}\n";
  total_list << "{init " << init_depth << "}\n";
  total_list << "{transition " << transition_depth << "}\n";
  total_list << "{emission " << emission_depth << "}\n";
  total_list << "{path " << path_depth << "}\n";
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
    int obs_depth;
    int init_depth;
    int transition_depth;
    int emission_depth;
    int path_depth;
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
extern "C" int viterbi_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" int apatb_viterbi_hw(volatile void * __xlx_apatb_param_obs, volatile void * __xlx_apatb_param_init, volatile void * __xlx_apatb_param_transition, volatile void * __xlx_apatb_param_emission, volatile void * __xlx_apatb_param_path) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_path);
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
          std::vector<sc_bv<8> > path_pc_buffer(140);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "path");
  
            // push token into output port buffer
            if (AESL_token != "") {
              path_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 140; j < e; j += 1, ++i) {
            ((char*)__xlx_apatb_param_path)[j] = path_pc_buffer[i].to_int64();
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
//obs
aesl_fh.touch(AUTOTB_TVIN_obs);
aesl_fh.touch(AUTOTB_TVOUT_obs);
//init
aesl_fh.touch(AUTOTB_TVIN_init);
aesl_fh.touch(AUTOTB_TVOUT_init);
//transition
aesl_fh.touch(AUTOTB_TVIN_transition);
aesl_fh.touch(AUTOTB_TVOUT_transition);
//emission
aesl_fh.touch(AUTOTB_TVIN_emission);
aesl_fh.touch(AUTOTB_TVOUT_emission);
//path
aesl_fh.touch(AUTOTB_TVIN_path);
aesl_fh.touch(AUTOTB_TVOUT_path);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_obs = 0;
// print obs Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_obs, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_obs = 0*1;
  if (__xlx_apatb_param_obs) {
    for (int j = 0  - 0, e = 140 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_obs)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_obs, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(140, &tcl_file.obs_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_obs, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_init = 0;
// print init Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_init, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_init = 0*8;
  if (__xlx_apatb_param_init) {
    for (int j = 0  - 0, e = 64 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_init)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_init, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(64, &tcl_file.init_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_init, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_transition = 0;
// print transition Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_transition, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_transition = 0*8;
  if (__xlx_apatb_param_transition) {
    for (int j = 0  - 0, e = 4096 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_transition)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_transition, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(4096, &tcl_file.transition_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_transition, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_emission = 0;
// print emission Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_emission, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_emission = 0*8;
  if (__xlx_apatb_param_emission) {
    for (int j = 0  - 0, e = 4096 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_emission)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_emission, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(4096, &tcl_file.emission_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_emission, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_path = 0;
// print path Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_path, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_path = 0*1;
  if (__xlx_apatb_param_path) {
    for (int j = 0  - 0, e = 140 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_path)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_path, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(140, &tcl_file.path_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_path, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
int ap_return = viterbi_hw_stub_wrapper(__xlx_apatb_param_obs, __xlx_apatb_param_init, __xlx_apatb_param_transition, __xlx_apatb_param_emission, __xlx_apatb_param_path);
CodeState = DUMP_OUTPUTS;
// print path Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_path, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_path = 0*1;
  if (__xlx_apatb_param_path) {
    for (int j = 0  - 0, e = 140 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_path)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_path, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(140, &tcl_file.path_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_path, __xlx_sprintf_buffer.data());
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
