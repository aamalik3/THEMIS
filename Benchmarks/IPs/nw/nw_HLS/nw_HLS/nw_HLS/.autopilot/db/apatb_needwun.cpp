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
#define AUTOTB_TVIN_SEQA "../tv/cdatafile/c.needwun.autotvin_SEQA.dat"
#define AUTOTB_TVOUT_SEQA "../tv/cdatafile/c.needwun.autotvout_SEQA.dat"
// wrapc file define:
#define AUTOTB_TVIN_SEQB "../tv/cdatafile/c.needwun.autotvin_SEQB.dat"
#define AUTOTB_TVOUT_SEQB "../tv/cdatafile/c.needwun.autotvout_SEQB.dat"
// wrapc file define:
#define AUTOTB_TVIN_alignedA "../tv/cdatafile/c.needwun.autotvin_alignedA.dat"
#define AUTOTB_TVOUT_alignedA "../tv/cdatafile/c.needwun.autotvout_alignedA.dat"
// wrapc file define:
#define AUTOTB_TVIN_alignedB "../tv/cdatafile/c.needwun.autotvin_alignedB.dat"
#define AUTOTB_TVOUT_alignedB "../tv/cdatafile/c.needwun.autotvout_alignedB.dat"
// wrapc file define:
#define AUTOTB_TVIN_M "../tv/cdatafile/c.needwun.autotvin_M.dat"
#define AUTOTB_TVOUT_M "../tv/cdatafile/c.needwun.autotvout_M.dat"
// wrapc file define:
#define AUTOTB_TVIN_ptr "../tv/cdatafile/c.needwun.autotvin_ptr.dat"
#define AUTOTB_TVOUT_ptr "../tv/cdatafile/c.needwun.autotvout_ptr.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_SEQA "../tv/rtldatafile/rtl.needwun.autotvout_SEQA.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_SEQB "../tv/rtldatafile/rtl.needwun.autotvout_SEQB.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_alignedA "../tv/rtldatafile/rtl.needwun.autotvout_alignedA.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_alignedB "../tv/rtldatafile/rtl.needwun.autotvout_alignedB.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_M "../tv/rtldatafile/rtl.needwun.autotvout_M.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_ptr "../tv/rtldatafile/rtl.needwun.autotvout_ptr.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  SEQA_depth = 0;
  SEQB_depth = 0;
  alignedA_depth = 0;
  alignedB_depth = 0;
  M_depth = 0;
  ptr_depth = 0;
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
  total_list << "{SEQA " << SEQA_depth << "}\n";
  total_list << "{SEQB " << SEQB_depth << "}\n";
  total_list << "{alignedA " << alignedA_depth << "}\n";
  total_list << "{alignedB " << alignedB_depth << "}\n";
  total_list << "{M " << M_depth << "}\n";
  total_list << "{ptr " << ptr_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int SEQA_depth;
    int SEQB_depth;
    int alignedA_depth;
    int alignedB_depth;
    int M_depth;
    int ptr_depth;
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
extern "C" void needwun_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_needwun_hw(volatile void * __xlx_apatb_param_SEQA, volatile void * __xlx_apatb_param_SEQB, volatile void * __xlx_apatb_param_alignedA, volatile void * __xlx_apatb_param_alignedB, volatile void * __xlx_apatb_param_M, volatile void * __xlx_apatb_param_ptr) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_alignedA);
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
          std::vector<sc_bv<8> > alignedA_pc_buffer(256);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "alignedA");
  
            // push token into output port buffer
            if (AESL_token != "") {
              alignedA_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {
            ((char*)__xlx_apatb_param_alignedA)[j] = alignedA_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_alignedB);
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
          std::vector<sc_bv<8> > alignedB_pc_buffer(256);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "alignedB");
  
            // push token into output port buffer
            if (AESL_token != "") {
              alignedB_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {
            ((char*)__xlx_apatb_param_alignedB)[j] = alignedB_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_M);
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
          std::vector<sc_bv<32> > M_pc_buffer(16641);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "M");
  
            // push token into output port buffer
            if (AESL_token != "") {
              M_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 16641; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_M)[j] = M_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_ptr);
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
          std::vector<sc_bv<8> > ptr_pc_buffer(16641);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "ptr");
  
            // push token into output port buffer
            if (AESL_token != "") {
              ptr_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 16641; j < e; j += 1, ++i) {
            ((char*)__xlx_apatb_param_ptr)[j] = ptr_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//SEQA
aesl_fh.touch(AUTOTB_TVIN_SEQA);
aesl_fh.touch(AUTOTB_TVOUT_SEQA);
//SEQB
aesl_fh.touch(AUTOTB_TVIN_SEQB);
aesl_fh.touch(AUTOTB_TVOUT_SEQB);
//alignedA
aesl_fh.touch(AUTOTB_TVIN_alignedA);
aesl_fh.touch(AUTOTB_TVOUT_alignedA);
//alignedB
aesl_fh.touch(AUTOTB_TVIN_alignedB);
aesl_fh.touch(AUTOTB_TVOUT_alignedB);
//M
aesl_fh.touch(AUTOTB_TVIN_M);
aesl_fh.touch(AUTOTB_TVOUT_M);
//ptr
aesl_fh.touch(AUTOTB_TVIN_ptr);
aesl_fh.touch(AUTOTB_TVOUT_ptr);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_SEQA = 0;
// print SEQA Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_SEQA, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_SEQA = 0*1;
  if (__xlx_apatb_param_SEQA) {
    for (int j = 0  - 0, e = 128 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_SEQA)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_SEQA, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(128, &tcl_file.SEQA_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_SEQA, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_SEQB = 0;
// print SEQB Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_SEQB, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_SEQB = 0*1;
  if (__xlx_apatb_param_SEQB) {
    for (int j = 0  - 0, e = 128 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_SEQB)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_SEQB, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(128, &tcl_file.SEQB_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_SEQB, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_alignedA = 0;
// print alignedA Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_alignedA, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_alignedA = 0*1;
  if (__xlx_apatb_param_alignedA) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_alignedA)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_alignedA, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.alignedA_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_alignedA, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_alignedB = 0;
// print alignedB Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_alignedB, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_alignedB = 0*1;
  if (__xlx_apatb_param_alignedB) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_alignedB)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_alignedB, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.alignedB_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_alignedB, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_M = 0;
// print M Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_M, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_M = 0*4;
  if (__xlx_apatb_param_M) {
    for (int j = 0  - 0, e = 16641 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_M)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_M, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(16641, &tcl_file.M_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_M, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_ptr = 0;
// print ptr Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_ptr, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_ptr = 0*1;
  if (__xlx_apatb_param_ptr) {
    for (int j = 0  - 0, e = 16641 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_ptr)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_ptr, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(16641, &tcl_file.ptr_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_ptr, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
needwun_hw_stub_wrapper(__xlx_apatb_param_SEQA, __xlx_apatb_param_SEQB, __xlx_apatb_param_alignedA, __xlx_apatb_param_alignedB, __xlx_apatb_param_M, __xlx_apatb_param_ptr);
CodeState = DUMP_OUTPUTS;
// print alignedA Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_alignedA, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_alignedA = 0*1;
  if (__xlx_apatb_param_alignedA) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_alignedA)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_alignedA, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.alignedA_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_alignedA, __xlx_sprintf_buffer.data());
}
// print alignedB Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_alignedB, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_alignedB = 0*1;
  if (__xlx_apatb_param_alignedB) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_alignedB)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_alignedB, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.alignedB_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_alignedB, __xlx_sprintf_buffer.data());
}
// print M Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_M, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_M = 0*4;
  if (__xlx_apatb_param_M) {
    for (int j = 0  - 0, e = 16641 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_M)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_M, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(16641, &tcl_file.M_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_M, __xlx_sprintf_buffer.data());
}
// print ptr Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_ptr, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_ptr = 0*1;
  if (__xlx_apatb_param_ptr) {
    for (int j = 0  - 0, e = 16641 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_ptr)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_ptr, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(16641, &tcl_file.ptr_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_ptr, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
