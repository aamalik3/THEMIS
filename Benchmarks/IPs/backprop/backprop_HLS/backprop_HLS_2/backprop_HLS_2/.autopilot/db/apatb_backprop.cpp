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
#define AUTOTB_TVIN_weights1 "../tv/cdatafile/c.backprop.autotvin_weights1.dat"
#define AUTOTB_TVOUT_weights1 "../tv/cdatafile/c.backprop.autotvout_weights1.dat"
// wrapc file define:
#define AUTOTB_TVIN_weights2 "../tv/cdatafile/c.backprop.autotvin_weights2.dat"
#define AUTOTB_TVOUT_weights2 "../tv/cdatafile/c.backprop.autotvout_weights2.dat"
// wrapc file define:
#define AUTOTB_TVIN_weights3 "../tv/cdatafile/c.backprop.autotvin_weights3.dat"
#define AUTOTB_TVOUT_weights3 "../tv/cdatafile/c.backprop.autotvout_weights3.dat"
// wrapc file define:
#define AUTOTB_TVIN_biases1 "../tv/cdatafile/c.backprop.autotvin_biases1.dat"
#define AUTOTB_TVOUT_biases1 "../tv/cdatafile/c.backprop.autotvout_biases1.dat"
// wrapc file define:
#define AUTOTB_TVIN_biases2 "../tv/cdatafile/c.backprop.autotvin_biases2.dat"
#define AUTOTB_TVOUT_biases2 "../tv/cdatafile/c.backprop.autotvout_biases2.dat"
// wrapc file define:
#define AUTOTB_TVIN_biases3 "../tv/cdatafile/c.backprop.autotvin_biases3.dat"
#define AUTOTB_TVOUT_biases3 "../tv/cdatafile/c.backprop.autotvout_biases3.dat"
// wrapc file define:
#define AUTOTB_TVIN_training_data "../tv/cdatafile/c.backprop.autotvin_training_data.dat"
#define AUTOTB_TVOUT_training_data "../tv/cdatafile/c.backprop.autotvout_training_data.dat"
// wrapc file define:
#define AUTOTB_TVIN_training_targets "../tv/cdatafile/c.backprop.autotvin_training_targets.dat"
#define AUTOTB_TVOUT_training_targets "../tv/cdatafile/c.backprop.autotvout_training_targets.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_weights1 "../tv/rtldatafile/rtl.backprop.autotvout_weights1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_weights2 "../tv/rtldatafile/rtl.backprop.autotvout_weights2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_weights3 "../tv/rtldatafile/rtl.backprop.autotvout_weights3.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_biases1 "../tv/rtldatafile/rtl.backprop.autotvout_biases1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_biases2 "../tv/rtldatafile/rtl.backprop.autotvout_biases2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_biases3 "../tv/rtldatafile/rtl.backprop.autotvout_biases3.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_training_data "../tv/rtldatafile/rtl.backprop.autotvout_training_data.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_training_targets "../tv/rtldatafile/rtl.backprop.autotvout_training_targets.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  weights1_depth = 0;
  weights2_depth = 0;
  weights3_depth = 0;
  biases1_depth = 0;
  biases2_depth = 0;
  biases3_depth = 0;
  training_data_depth = 0;
  training_targets_depth = 0;
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
  total_list << "{weights1 " << weights1_depth << "}\n";
  total_list << "{weights2 " << weights2_depth << "}\n";
  total_list << "{weights3 " << weights3_depth << "}\n";
  total_list << "{biases1 " << biases1_depth << "}\n";
  total_list << "{biases2 " << biases2_depth << "}\n";
  total_list << "{biases3 " << biases3_depth << "}\n";
  total_list << "{training_data " << training_data_depth << "}\n";
  total_list << "{training_targets " << training_targets_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int weights1_depth;
    int weights2_depth;
    int weights3_depth;
    int biases1_depth;
    int biases2_depth;
    int biases3_depth;
    int training_data_depth;
    int training_targets_depth;
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
extern "C" void backprop_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_backprop_hw(volatile void * __xlx_apatb_param_weights1, volatile void * __xlx_apatb_param_weights2, volatile void * __xlx_apatb_param_weights3, volatile void * __xlx_apatb_param_biases1, volatile void * __xlx_apatb_param_biases2, volatile void * __xlx_apatb_param_biases3, volatile void * __xlx_apatb_param_training_data, volatile void * __xlx_apatb_param_training_targets) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_weights1);
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
          std::vector<sc_bv<64> > weights1_pc_buffer(832);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "weights1");
  
            // push token into output port buffer
            if (AESL_token != "") {
              weights1_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 832; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_weights1)[j] = weights1_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_weights2);
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
          std::vector<sc_bv<64> > weights2_pc_buffer(4096);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "weights2");
  
            // push token into output port buffer
            if (AESL_token != "") {
              weights2_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 4096; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_weights2)[j] = weights2_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_weights3);
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
          std::vector<sc_bv<64> > weights3_pc_buffer(192);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "weights3");
  
            // push token into output port buffer
            if (AESL_token != "") {
              weights3_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 192; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_weights3)[j] = weights3_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_biases1);
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
          std::vector<sc_bv<64> > biases1_pc_buffer(64);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "biases1");
  
            // push token into output port buffer
            if (AESL_token != "") {
              biases1_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 64; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_biases1)[j] = biases1_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_biases2);
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
          std::vector<sc_bv<64> > biases2_pc_buffer(64);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "biases2");
  
            // push token into output port buffer
            if (AESL_token != "") {
              biases2_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 64; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_biases2)[j] = biases2_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_biases3);
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
          std::vector<sc_bv<64> > biases3_pc_buffer(3);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "biases3");
  
            // push token into output port buffer
            if (AESL_token != "") {
              biases3_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 3; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_biases3)[j] = biases3_pc_buffer[i].to_int64();
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
//weights1
aesl_fh.touch(AUTOTB_TVIN_weights1);
aesl_fh.touch(AUTOTB_TVOUT_weights1);
//weights2
aesl_fh.touch(AUTOTB_TVIN_weights2);
aesl_fh.touch(AUTOTB_TVOUT_weights2);
//weights3
aesl_fh.touch(AUTOTB_TVIN_weights3);
aesl_fh.touch(AUTOTB_TVOUT_weights3);
//biases1
aesl_fh.touch(AUTOTB_TVIN_biases1);
aesl_fh.touch(AUTOTB_TVOUT_biases1);
//biases2
aesl_fh.touch(AUTOTB_TVIN_biases2);
aesl_fh.touch(AUTOTB_TVOUT_biases2);
//biases3
aesl_fh.touch(AUTOTB_TVIN_biases3);
aesl_fh.touch(AUTOTB_TVOUT_biases3);
//training_data
aesl_fh.touch(AUTOTB_TVIN_training_data);
aesl_fh.touch(AUTOTB_TVOUT_training_data);
//training_targets
aesl_fh.touch(AUTOTB_TVIN_training_targets);
aesl_fh.touch(AUTOTB_TVOUT_training_targets);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_weights1 = 0;
// print weights1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_weights1, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_weights1 = 0*8;
  if (__xlx_apatb_param_weights1) {
    for (int j = 0  - 0, e = 832 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_weights1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_weights1, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(832, &tcl_file.weights1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_weights1, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_weights2 = 0;
// print weights2 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_weights2, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_weights2 = 0*8;
  if (__xlx_apatb_param_weights2) {
    for (int j = 0  - 0, e = 4096 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_weights2)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_weights2, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(4096, &tcl_file.weights2_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_weights2, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_weights3 = 0;
// print weights3 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_weights3, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_weights3 = 0*8;
  if (__xlx_apatb_param_weights3) {
    for (int j = 0  - 0, e = 192 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_weights3)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_weights3, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(192, &tcl_file.weights3_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_weights3, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_biases1 = 0;
// print biases1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_biases1, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_biases1 = 0*8;
  if (__xlx_apatb_param_biases1) {
    for (int j = 0  - 0, e = 64 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_biases1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_biases1, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(64, &tcl_file.biases1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_biases1, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_biases2 = 0;
// print biases2 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_biases2, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_biases2 = 0*8;
  if (__xlx_apatb_param_biases2) {
    for (int j = 0  - 0, e = 64 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_biases2)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_biases2, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(64, &tcl_file.biases2_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_biases2, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_biases3 = 0;
// print biases3 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_biases3, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_biases3 = 0*8;
  if (__xlx_apatb_param_biases3) {
    for (int j = 0  - 0, e = 3 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_biases3)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_biases3, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(3, &tcl_file.biases3_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_biases3, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_training_data = 0;
// print training_data Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_training_data, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_training_data = 0*8;
  if (__xlx_apatb_param_training_data) {
    for (int j = 0  - 0, e = 2119 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_training_data)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_training_data, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(2119, &tcl_file.training_data_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_training_data, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_training_targets = 0;
// print training_targets Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_training_targets, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_training_targets = 0*8;
  if (__xlx_apatb_param_training_targets) {
    for (int j = 0  - 0, e = 489 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_training_targets)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_training_targets, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(489, &tcl_file.training_targets_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_training_targets, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
backprop_hw_stub_wrapper(__xlx_apatb_param_weights1, __xlx_apatb_param_weights2, __xlx_apatb_param_weights3, __xlx_apatb_param_biases1, __xlx_apatb_param_biases2, __xlx_apatb_param_biases3, __xlx_apatb_param_training_data, __xlx_apatb_param_training_targets);
CodeState = DUMP_OUTPUTS;
// print weights1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_weights1, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_weights1 = 0*8;
  if (__xlx_apatb_param_weights1) {
    for (int j = 0  - 0, e = 832 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_weights1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_weights1, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(832, &tcl_file.weights1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_weights1, __xlx_sprintf_buffer.data());
}
// print weights2 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_weights2, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_weights2 = 0*8;
  if (__xlx_apatb_param_weights2) {
    for (int j = 0  - 0, e = 4096 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_weights2)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_weights2, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(4096, &tcl_file.weights2_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_weights2, __xlx_sprintf_buffer.data());
}
// print weights3 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_weights3, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_weights3 = 0*8;
  if (__xlx_apatb_param_weights3) {
    for (int j = 0  - 0, e = 192 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_weights3)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_weights3, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(192, &tcl_file.weights3_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_weights3, __xlx_sprintf_buffer.data());
}
// print biases1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_biases1, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_biases1 = 0*8;
  if (__xlx_apatb_param_biases1) {
    for (int j = 0  - 0, e = 64 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_biases1)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_biases1, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(64, &tcl_file.biases1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_biases1, __xlx_sprintf_buffer.data());
}
// print biases2 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_biases2, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_biases2 = 0*8;
  if (__xlx_apatb_param_biases2) {
    for (int j = 0  - 0, e = 64 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_biases2)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_biases2, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(64, &tcl_file.biases2_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_biases2, __xlx_sprintf_buffer.data());
}
// print biases3 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_biases3, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_biases3 = 0*8;
  if (__xlx_apatb_param_biases3) {
    for (int j = 0  - 0, e = 3 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_biases3)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_biases3, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(3, &tcl_file.biases3_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_biases3, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
