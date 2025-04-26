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
#define AUTOTB_TVIN_n_points "../tv/cdatafile/c.md.autotvin_n_points.dat"
#define AUTOTB_TVOUT_n_points "../tv/cdatafile/c.md.autotvout_n_points.dat"
// wrapc file define:
#define AUTOTB_TVIN_force "../tv/cdatafile/c.md.autotvin_force_r.dat"
#define AUTOTB_TVOUT_force "../tv/cdatafile/c.md.autotvout_force_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_position "../tv/cdatafile/c.md.autotvin_position.dat"
#define AUTOTB_TVOUT_position "../tv/cdatafile/c.md.autotvout_position.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_n_points "../tv/rtldatafile/rtl.md.autotvout_n_points.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_force "../tv/rtldatafile/rtl.md.autotvout_force_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_position "../tv/rtldatafile/rtl.md.autotvout_position.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  n_points_depth = 0;
  force_depth = 0;
  position_depth = 0;
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
  total_list << "{n_points " << n_points_depth << "}\n";
  total_list << "{force_r " << force_depth << "}\n";
  total_list << "{position " << position_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int n_points_depth;
    int force_depth;
    int position_depth;
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
struct __cosim_s18__ { char data[24]; };
extern "C" void md_hw_stub_wrapper(volatile void *, volatile void *, volatile void *);

extern "C" void apatb_md_hw(volatile void * __xlx_apatb_param_n_points, volatile void * __xlx_apatb_param_force, volatile void * __xlx_apatb_param_position) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_force);
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
          std::vector<sc_bv<192> > force_pc_buffer(640);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "force");
  
            // push token into output port buffer
            if (AESL_token != "") {
              force_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 640; j < e; j += 1, ++i) {((long long*)__xlx_apatb_param_force)[j*3+0] = force_pc_buffer[i].range(63,0).to_int64();
((long long*)__xlx_apatb_param_force)[j*3+1] = force_pc_buffer[i].range(127,64).to_int64();
((long long*)__xlx_apatb_param_force)[j*3+2] = force_pc_buffer[i].range(191,128).to_int64();
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
//n_points
aesl_fh.touch(AUTOTB_TVIN_n_points);
aesl_fh.touch(AUTOTB_TVOUT_n_points);
//force
aesl_fh.touch(AUTOTB_TVIN_force);
aesl_fh.touch(AUTOTB_TVOUT_force);
//position
aesl_fh.touch(AUTOTB_TVIN_position);
aesl_fh.touch(AUTOTB_TVOUT_position);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_n_points = 0;
// print n_points Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_n_points, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_n_points = 0*4;
  if (__xlx_apatb_param_n_points) {
    for (int j = 0  - 0, e = 64 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_n_points)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_n_points, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(64, &tcl_file.n_points_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_n_points, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_force = 0;
// print force Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_force, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_force = 0*24;
  if (__xlx_apatb_param_force) {
    for (int j = 0  - 0, e = 640 - 0; j != e; ++j) {
sc_bv<192> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_force)[j*3+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_force)[j*3+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_force)[j*3+2];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_force, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(640, &tcl_file.force_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_force, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_position = 0;
// print position Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_position, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_position = 0*24;
  if (__xlx_apatb_param_position) {
    for (int j = 0  - 0, e = 640 - 0; j != e; ++j) {
sc_bv<192> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_position)[j*3+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_position)[j*3+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_position)[j*3+2];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_position, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(640, &tcl_file.position_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_position, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
md_hw_stub_wrapper(__xlx_apatb_param_n_points, __xlx_apatb_param_force, __xlx_apatb_param_position);
CodeState = DUMP_OUTPUTS;
// print force Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_force, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_force = 0*24;
  if (__xlx_apatb_param_force) {
    for (int j = 0  - 0, e = 640 - 0; j != e; ++j) {
sc_bv<192> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_force)[j*3+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_force)[j*3+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_force)[j*3+2];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_force, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(640, &tcl_file.force_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_force, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
