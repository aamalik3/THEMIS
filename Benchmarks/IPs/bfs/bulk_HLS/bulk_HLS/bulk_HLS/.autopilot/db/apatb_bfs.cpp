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
#define AUTOTB_TVIN_nodes "../tv/cdatafile/c.bfs.autotvin_nodes.dat"
#define AUTOTB_TVOUT_nodes "../tv/cdatafile/c.bfs.autotvout_nodes.dat"
// wrapc file define:
#define AUTOTB_TVIN_edges "../tv/cdatafile/c.bfs.autotvin_edges.dat"
#define AUTOTB_TVOUT_edges "../tv/cdatafile/c.bfs.autotvout_edges.dat"
// wrapc file define:
#define AUTOTB_TVIN_starting_node "../tv/cdatafile/c.bfs.autotvin_starting_node.dat"
#define AUTOTB_TVOUT_starting_node "../tv/cdatafile/c.bfs.autotvout_starting_node.dat"
// wrapc file define:
#define AUTOTB_TVIN_level "../tv/cdatafile/c.bfs.autotvin_level.dat"
#define AUTOTB_TVOUT_level "../tv/cdatafile/c.bfs.autotvout_level.dat"
// wrapc file define:
#define AUTOTB_TVIN_level_counts "../tv/cdatafile/c.bfs.autotvin_level_counts.dat"
#define AUTOTB_TVOUT_level_counts "../tv/cdatafile/c.bfs.autotvout_level_counts.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_nodes "../tv/rtldatafile/rtl.bfs.autotvout_nodes.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_edges "../tv/rtldatafile/rtl.bfs.autotvout_edges.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_starting_node "../tv/rtldatafile/rtl.bfs.autotvout_starting_node.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_level "../tv/rtldatafile/rtl.bfs.autotvout_level.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_level_counts "../tv/rtldatafile/rtl.bfs.autotvout_level_counts.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  nodes_depth = 0;
  edges_depth = 0;
  starting_node_depth = 0;
  level_depth = 0;
  level_counts_depth = 0;
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
  total_list << "{nodes " << nodes_depth << "}\n";
  total_list << "{edges " << edges_depth << "}\n";
  total_list << "{starting_node " << starting_node_depth << "}\n";
  total_list << "{level " << level_depth << "}\n";
  total_list << "{level_counts " << level_counts_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int nodes_depth;
    int edges_depth;
    int starting_node_depth;
    int level_depth;
    int level_counts_depth;
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
struct __cosim_s10__ { char data[16]; };
extern "C" void bfs_hw_stub_wrapper(volatile void *, volatile void *, long long, volatile void *, volatile void *);

extern "C" void apatb_bfs_hw(volatile void * __xlx_apatb_param_nodes, volatile void * __xlx_apatb_param_edges, long long __xlx_apatb_param_starting_node, volatile void * __xlx_apatb_param_level, volatile void * __xlx_apatb_param_level_counts) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_level);
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
          std::vector<sc_bv<8> > level_pc_buffer(256);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "level");
  
            // push token into output port buffer
            if (AESL_token != "") {
              level_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 256; j < e; j += 1, ++i) {
            ((char*)__xlx_apatb_param_level)[j] = level_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_level_counts);
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
          std::vector<sc_bv<64> > level_counts_pc_buffer(10);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "level_counts");
  
            // push token into output port buffer
            if (AESL_token != "") {
              level_counts_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 10; j < e; j += 1, ++i) {
            ((long long*)__xlx_apatb_param_level_counts)[j] = level_counts_pc_buffer[i].to_int64();
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
//nodes
aesl_fh.touch(AUTOTB_TVIN_nodes);
aesl_fh.touch(AUTOTB_TVOUT_nodes);
//edges
aesl_fh.touch(AUTOTB_TVIN_edges);
aesl_fh.touch(AUTOTB_TVOUT_edges);
//starting_node
aesl_fh.touch(AUTOTB_TVIN_starting_node);
aesl_fh.touch(AUTOTB_TVOUT_starting_node);
//level
aesl_fh.touch(AUTOTB_TVIN_level);
aesl_fh.touch(AUTOTB_TVOUT_level);
//level_counts
aesl_fh.touch(AUTOTB_TVIN_level_counts);
aesl_fh.touch(AUTOTB_TVOUT_level_counts);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_nodes = 0;
// print nodes Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_nodes, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_nodes = 0*16;
  if (__xlx_apatb_param_nodes) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<128> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_nodes)[j*2+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_nodes)[j*2+1];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_nodes, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.nodes_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_nodes, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_edges = 0;
// print edges Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_edges, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_edges = 0*8;
  if (__xlx_apatb_param_edges) {
    for (int j = 0  - 0, e = 4096 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_edges)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_edges, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(4096, &tcl_file.edges_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_edges, __xlx_sprintf_buffer.data());
}
// print starting_node Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_starting_node, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = *((long long*)&__xlx_apatb_param_starting_node);

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_starting_node, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.starting_node_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_starting_node, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_level = 0;
// print level Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_level, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_level = 0*1;
  if (__xlx_apatb_param_level) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_level)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_level, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.level_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_level, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_level_counts = 0;
// print level_counts Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_level_counts, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_level_counts = 0*8;
  if (__xlx_apatb_param_level_counts) {
    for (int j = 0  - 0, e = 10 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_level_counts)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_level_counts, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(10, &tcl_file.level_counts_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_level_counts, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
bfs_hw_stub_wrapper(__xlx_apatb_param_nodes, __xlx_apatb_param_edges, __xlx_apatb_param_starting_node, __xlx_apatb_param_level, __xlx_apatb_param_level_counts);
CodeState = DUMP_OUTPUTS;
// print level Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_level, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_level = 0*1;
  if (__xlx_apatb_param_level) {
    for (int j = 0  - 0, e = 256 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_level)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_level, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(256, &tcl_file.level_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_level, __xlx_sprintf_buffer.data());
}
// print level_counts Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_level_counts, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_level_counts = 0*8;
  if (__xlx_apatb_param_level_counts) {
    for (int j = 0  - 0, e = 10 - 0; j != e; ++j) {
sc_bv<64> __xlx_tmp_lv = ((long long*)__xlx_apatb_param_level_counts)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_level_counts, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(10, &tcl_file.level_counts_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_level_counts, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
