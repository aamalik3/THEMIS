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
#define AUTOTB_TVIN_orig "../tv/cdatafile/c.stencil.autotvin_orig.dat"
#define AUTOTB_TVOUT_orig "../tv/cdatafile/c.stencil.autotvout_orig.dat"
// wrapc file define:
#define AUTOTB_TVIN_sol "../tv/cdatafile/c.stencil.autotvin_sol.dat"
#define AUTOTB_TVOUT_sol "../tv/cdatafile/c.stencil.autotvout_sol.dat"
// wrapc file define:
#define AUTOTB_TVIN_filter "../tv/cdatafile/c.stencil.autotvin_filter.dat"
#define AUTOTB_TVOUT_filter "../tv/cdatafile/c.stencil.autotvout_filter.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_orig "../tv/rtldatafile/rtl.stencil.autotvout_orig.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_sol "../tv/rtldatafile/rtl.stencil.autotvout_sol.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_filter "../tv/rtldatafile/rtl.stencil.autotvout_filter.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  orig_depth = 0;
  sol_depth = 0;
  filter_depth = 0;
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
  total_list << "{orig " << orig_depth << "}\n";
  total_list << "{sol " << sol_depth << "}\n";
  total_list << "{filter " << filter_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int orig_depth;
    int sol_depth;
    int filter_depth;
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
extern "C" void stencil_hw_stub_wrapper(volatile void *, volatile void *, volatile void *);

extern "C" void apatb_stencil_hw(volatile void * __xlx_apatb_param_orig, volatile void * __xlx_apatb_param_sol, volatile void * __xlx_apatb_param_filter) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_sol);
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
          std::vector<sc_bv<32> > sol_pc_buffer(8192);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "sol");
  
            // push token into output port buffer
            if (AESL_token != "") {
              sol_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 8192; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_sol)[j] = sol_pc_buffer[i].to_int64();
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
//orig
aesl_fh.touch(AUTOTB_TVIN_orig);
aesl_fh.touch(AUTOTB_TVOUT_orig);
//sol
aesl_fh.touch(AUTOTB_TVIN_sol);
aesl_fh.touch(AUTOTB_TVOUT_sol);
//filter
aesl_fh.touch(AUTOTB_TVIN_filter);
aesl_fh.touch(AUTOTB_TVOUT_filter);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_orig = 0;
// print orig Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_orig, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_orig = 0*4;
  if (__xlx_apatb_param_orig) {
    for (int j = 0  - 0, e = 8192 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_orig)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_orig, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8192, &tcl_file.orig_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_orig, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_sol = 0;
// print sol Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_sol, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_sol = 0*4;
  if (__xlx_apatb_param_sol) {
    for (int j = 0  - 0, e = 8192 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_sol)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_sol, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8192, &tcl_file.sol_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_sol, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_filter = 0;
// print filter Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_filter, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_filter = 0*4;
  if (__xlx_apatb_param_filter) {
    for (int j = 0  - 0, e = 9 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_filter)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_filter, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(9, &tcl_file.filter_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_filter, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
stencil_hw_stub_wrapper(__xlx_apatb_param_orig, __xlx_apatb_param_sol, __xlx_apatb_param_filter);
CodeState = DUMP_OUTPUTS;
// print sol Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_sol, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_sol = 0*4;
  if (__xlx_apatb_param_sol) {
    for (int j = 0  - 0, e = 8192 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_sol)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_sol, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8192, &tcl_file.sol_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_sol, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
