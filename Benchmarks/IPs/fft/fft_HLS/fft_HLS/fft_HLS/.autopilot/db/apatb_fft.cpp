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
#define AUTOTB_TVIN_real "../tv/cdatafile/c.fft.autotvin_real_r.dat"
#define AUTOTB_TVOUT_real "../tv/cdatafile/c.fft.autotvout_real_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_img "../tv/cdatafile/c.fft.autotvin_img.dat"
#define AUTOTB_TVOUT_img "../tv/cdatafile/c.fft.autotvout_img.dat"
// wrapc file define:
#define AUTOTB_TVIN_real_twid "../tv/cdatafile/c.fft.autotvin_real_twid.dat"
#define AUTOTB_TVOUT_real_twid "../tv/cdatafile/c.fft.autotvout_real_twid.dat"
// wrapc file define:
#define AUTOTB_TVIN_img_twid "../tv/cdatafile/c.fft.autotvin_img_twid.dat"
#define AUTOTB_TVOUT_img_twid "../tv/cdatafile/c.fft.autotvout_img_twid.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_real "../tv/rtldatafile/rtl.fft.autotvout_real_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_img "../tv/rtldatafile/rtl.fft.autotvout_img.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_real_twid "../tv/rtldatafile/rtl.fft.autotvout_real_twid.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_img_twid "../tv/rtldatafile/rtl.fft.autotvout_img_twid.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  real_depth = 0;
  img_depth = 0;
  real_twid_depth = 0;
  img_twid_depth = 0;
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
  total_list << "{real_r " << real_depth << "}\n";
  total_list << "{img " << img_depth << "}\n";
  total_list << "{real_twid " << real_twid_depth << "}\n";
  total_list << "{img_twid " << img_twid_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int real_depth;
    int img_depth;
    int real_twid_depth;
    int img_twid_depth;
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
extern "C" void fft_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_fft_hw(volatile void * __xlx_apatb_param_real, volatile void * __xlx_apatb_param_img, volatile void * __xlx_apatb_param_real_twid, volatile void * __xlx_apatb_param_img_twid) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_real);
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
          std::vector<sc_bv<64> > real_pc_buffer(1024);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "real");
  
            // push token into output port buffer
            if (AESL_token != "") {
              real_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 1024; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_real)[j] = real_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_img);
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
          std::vector<sc_bv<64> > img_pc_buffer(1024);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "img");
  
            // push token into output port buffer
            if (AESL_token != "") {
              img_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 1024; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_img)[j] = img_pc_buffer[i].to_int64();
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
//real
aesl_fh.touch(AUTOTB_TVIN_real);
aesl_fh.touch(AUTOTB_TVOUT_real);
//img
aesl_fh.touch(AUTOTB_TVIN_img);
aesl_fh.touch(AUTOTB_TVOUT_img);
//real_twid
aesl_fh.touch(AUTOTB_TVIN_real_twid);
aesl_fh.touch(AUTOTB_TVOUT_real_twid);
//img_twid
aesl_fh.touch(AUTOTB_TVIN_img_twid);
aesl_fh.touch(AUTOTB_TVOUT_img_twid);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_real = 0;
// print real Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_real, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_real = 0*8;
  if (__xlx_apatb_param_real) {
    for (int j = 0  - 0, e = 1024 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_real)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_real, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(1024, &tcl_file.real_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_real, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_img = 0;
// print img Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_img, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_img = 0*8;
  if (__xlx_apatb_param_img) {
    for (int j = 0  - 0, e = 1024 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_img)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_img, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(1024, &tcl_file.img_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_img, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_real_twid = 0;
// print real_twid Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_real_twid, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_real_twid = 0*8;
  if (__xlx_apatb_param_real_twid) {
    for (int j = 0  - 0, e = 512 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_real_twid)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_real_twid, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(512, &tcl_file.real_twid_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_real_twid, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_img_twid = 0;
// print img_twid Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_img_twid, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_img_twid = 0*8;
  if (__xlx_apatb_param_img_twid) {
    for (int j = 0  - 0, e = 512 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_img_twid)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_img_twid, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(512, &tcl_file.img_twid_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_img_twid, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
fft_hw_stub_wrapper(__xlx_apatb_param_real, __xlx_apatb_param_img, __xlx_apatb_param_real_twid, __xlx_apatb_param_img_twid);
CodeState = DUMP_OUTPUTS;
// print real Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_real, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_real = 0*8;
  if (__xlx_apatb_param_real) {
    for (int j = 0  - 0, e = 1024 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_real)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_real, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(1024, &tcl_file.real_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_real, __xlx_sprintf_buffer.data());
}
// print img Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_img, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_img = 0*8;
  if (__xlx_apatb_param_img) {
    for (int j = 0  - 0, e = 1024 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_img)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_img, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(1024, &tcl_file.img_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_img, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
