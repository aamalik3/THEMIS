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
#define AUTOTB_TVIN_val "../tv/cdatafile/c.spmv.autotvin_val_r.dat"
#define AUTOTB_TVOUT_val "../tv/cdatafile/c.spmv.autotvout_val_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_cols "../tv/cdatafile/c.spmv.autotvin_cols.dat"
#define AUTOTB_TVOUT_cols "../tv/cdatafile/c.spmv.autotvout_cols.dat"
// wrapc file define:
#define AUTOTB_TVIN_rowDelimiters "../tv/cdatafile/c.spmv.autotvin_rowDelimiters.dat"
#define AUTOTB_TVOUT_rowDelimiters "../tv/cdatafile/c.spmv.autotvout_rowDelimiters.dat"
// wrapc file define:
#define AUTOTB_TVIN_vec "../tv/cdatafile/c.spmv.autotvin_vec.dat"
#define AUTOTB_TVOUT_vec "../tv/cdatafile/c.spmv.autotvout_vec.dat"
// wrapc file define:
#define AUTOTB_TVIN_out "../tv/cdatafile/c.spmv.autotvin_out_r.dat"
#define AUTOTB_TVOUT_out "../tv/cdatafile/c.spmv.autotvout_out_r.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_val "../tv/rtldatafile/rtl.spmv.autotvout_val_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_cols "../tv/rtldatafile/rtl.spmv.autotvout_cols.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_rowDelimiters "../tv/rtldatafile/rtl.spmv.autotvout_rowDelimiters.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_vec "../tv/rtldatafile/rtl.spmv.autotvout_vec.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_out "../tv/rtldatafile/rtl.spmv.autotvout_out_r.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  val_depth = 0;
  cols_depth = 0;
  rowDelimiters_depth = 0;
  vec_depth = 0;
  out_depth = 0;
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
  total_list << "{val_r " << val_depth << "}\n";
  total_list << "{cols " << cols_depth << "}\n";
  total_list << "{rowDelimiters " << rowDelimiters_depth << "}\n";
  total_list << "{vec " << vec_depth << "}\n";
  total_list << "{out_r " << out_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int val_depth;
    int cols_depth;
    int rowDelimiters_depth;
    int vec_depth;
    int out_depth;
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
extern "C" void spmv_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_spmv_hw(volatile void * __xlx_apatb_param_val, volatile void * __xlx_apatb_param_cols, volatile void * __xlx_apatb_param_rowDelimiters, volatile void * __xlx_apatb_param_vec, volatile void * __xlx_apatb_param_out) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_out);
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
          std::vector<sc_bv<64> > out_pc_buffer(494);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "out");
  
            // push token into output port buffer
            if (AESL_token != "") {
              out_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 494; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_out)[j] = out_pc_buffer[i].to_int64();
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
//val
aesl_fh.touch(AUTOTB_TVIN_val);
aesl_fh.touch(AUTOTB_TVOUT_val);
//cols
aesl_fh.touch(AUTOTB_TVIN_cols);
aesl_fh.touch(AUTOTB_TVOUT_cols);
//rowDelimiters
aesl_fh.touch(AUTOTB_TVIN_rowDelimiters);
aesl_fh.touch(AUTOTB_TVOUT_rowDelimiters);
//vec
aesl_fh.touch(AUTOTB_TVIN_vec);
aesl_fh.touch(AUTOTB_TVOUT_vec);
//out
aesl_fh.touch(AUTOTB_TVIN_out);
aesl_fh.touch(AUTOTB_TVOUT_out);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_val = 0;
// print val Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_val, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_val = 0*8;
  if (__xlx_apatb_param_val) {
    for (int j = 0  - 0, e = 1666 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_val)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_val, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(1666, &tcl_file.val_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_val, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_cols = 0;
// print cols Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_cols, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_cols = 0*4;
  if (__xlx_apatb_param_cols) {
    for (int j = 0  - 0, e = 1666 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_cols)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_cols, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(1666, &tcl_file.cols_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_cols, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_rowDelimiters = 0;
// print rowDelimiters Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_rowDelimiters, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_rowDelimiters = 0*4;
  if (__xlx_apatb_param_rowDelimiters) {
    for (int j = 0  - 0, e = 495 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_rowDelimiters)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_rowDelimiters, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(495, &tcl_file.rowDelimiters_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_rowDelimiters, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_vec = 0;
// print vec Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_vec, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_vec = 0*8;
  if (__xlx_apatb_param_vec) {
    for (int j = 0  - 0, e = 494 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_vec)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_vec, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(494, &tcl_file.vec_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_vec, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_out = 0;
// print out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_out, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_out = 0*8;
  if (__xlx_apatb_param_out) {
    for (int j = 0  - 0, e = 494 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_out, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(494, &tcl_file.out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_out, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
spmv_hw_stub_wrapper(__xlx_apatb_param_val, __xlx_apatb_param_cols, __xlx_apatb_param_rowDelimiters, __xlx_apatb_param_vec, __xlx_apatb_param_out);
CodeState = DUMP_OUTPUTS;
// print out Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_out, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_out = 0*8;
  if (__xlx_apatb_param_out) {
    for (int j = 0  - 0, e = 494 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_out)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_out, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(494, &tcl_file.out_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_out, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
