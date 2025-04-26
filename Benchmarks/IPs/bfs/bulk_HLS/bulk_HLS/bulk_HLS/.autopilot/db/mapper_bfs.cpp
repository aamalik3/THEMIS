#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
struct __cosim_s10__ { char data[16]; };
extern "C" void bfs(__cosim_s10__*, long long*, long long, char*, long long*);
extern "C" void apatb_bfs_hw(volatile void * __xlx_apatb_param_nodes, volatile void * __xlx_apatb_param_edges, long long __xlx_apatb_param_starting_node, volatile void * __xlx_apatb_param_level, volatile void * __xlx_apatb_param_level_counts) {
  // Collect __xlx_nodes__tmp_vec
  vector<sc_bv<128> >__xlx_nodes__tmp_vec;
  for (int j = 0, e = 256; j != e; ++j) {
    sc_bv<128> _xlx_tmp_sc;
    _xlx_tmp_sc.range(63, 0) = ((long long*)__xlx_apatb_param_nodes)[j*2+0];
    _xlx_tmp_sc.range(127, 64) = ((long long*)__xlx_apatb_param_nodes)[j*2+1];
    __xlx_nodes__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_nodes = 256;
  int __xlx_offset_param_nodes = 0;
  int __xlx_offset_byte_param_nodes = 0*16;
  __cosim_s10__* __xlx_nodes__input_buffer= new __cosim_s10__[__xlx_nodes__tmp_vec.size()];
  for (int i = 0; i < __xlx_nodes__tmp_vec.size(); ++i) {
    ((long long*)__xlx_nodes__input_buffer)[i*2+0] = __xlx_nodes__tmp_vec[i].range(63, 0).to_uint64();
    ((long long*)__xlx_nodes__input_buffer)[i*2+1] = __xlx_nodes__tmp_vec[i].range(127, 64).to_uint64();
  }
  // Collect __xlx_edges__tmp_vec
  vector<sc_bv<64> >__xlx_edges__tmp_vec;
  for (int j = 0, e = 4096; j != e; ++j) {
    __xlx_edges__tmp_vec.push_back(((long long*)__xlx_apatb_param_edges)[j]);
  }
  int __xlx_size_param_edges = 4096;
  int __xlx_offset_param_edges = 0;
  int __xlx_offset_byte_param_edges = 0*8;
  long long* __xlx_edges__input_buffer= new long long[__xlx_edges__tmp_vec.size()];
  for (int i = 0; i < __xlx_edges__tmp_vec.size(); ++i) {
    __xlx_edges__input_buffer[i] = __xlx_edges__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_level__tmp_vec
  vector<sc_bv<8> >__xlx_level__tmp_vec;
  for (int j = 0, e = 256; j != e; ++j) {
    __xlx_level__tmp_vec.push_back(((char*)__xlx_apatb_param_level)[j]);
  }
  int __xlx_size_param_level = 256;
  int __xlx_offset_param_level = 0;
  int __xlx_offset_byte_param_level = 0*1;
  char* __xlx_level__input_buffer= new char[__xlx_level__tmp_vec.size()];
  for (int i = 0; i < __xlx_level__tmp_vec.size(); ++i) {
    __xlx_level__input_buffer[i] = __xlx_level__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_level_counts__tmp_vec
  vector<sc_bv<64> >__xlx_level_counts__tmp_vec;
  for (int j = 0, e = 10; j != e; ++j) {
    __xlx_level_counts__tmp_vec.push_back(((long long*)__xlx_apatb_param_level_counts)[j]);
  }
  int __xlx_size_param_level_counts = 10;
  int __xlx_offset_param_level_counts = 0;
  int __xlx_offset_byte_param_level_counts = 0*8;
  long long* __xlx_level_counts__input_buffer= new long long[__xlx_level_counts__tmp_vec.size()];
  for (int i = 0; i < __xlx_level_counts__tmp_vec.size(); ++i) {
    __xlx_level_counts__input_buffer[i] = __xlx_level_counts__tmp_vec[i].range(63, 0).to_uint64();
  }
  // DUT call
  bfs(__xlx_nodes__input_buffer, __xlx_edges__input_buffer, __xlx_apatb_param_starting_node, __xlx_level__input_buffer, __xlx_level_counts__input_buffer);
// print __xlx_apatb_param_nodes
  sc_bv<128>*__xlx_nodes_output_buffer = new sc_bv<128>[__xlx_size_param_nodes];
  for (int i = 0; i < __xlx_size_param_nodes; ++i) {
    char* start = (char*)(&(__xlx_nodes__input_buffer[__xlx_offset_param_nodes]));
    __xlx_nodes_output_buffer[i].range(63, 0) = ((long long*)start)[i*2+0];
    __xlx_nodes_output_buffer[i].range(127, 64) = ((long long*)start)[i*2+1];
  }
  for (int i = 0; i < __xlx_size_param_nodes; ++i) {
    ((long long*)__xlx_apatb_param_nodes)[i*2+0] = __xlx_nodes_output_buffer[i].range(63, 0).to_uint64();
    ((long long*)__xlx_apatb_param_nodes)[i*2+1] = __xlx_nodes_output_buffer[i].range(127, 64).to_uint64();
  }
// print __xlx_apatb_param_edges
  sc_bv<64>*__xlx_edges_output_buffer = new sc_bv<64>[__xlx_size_param_edges];
  for (int i = 0; i < __xlx_size_param_edges; ++i) {
    __xlx_edges_output_buffer[i] = __xlx_edges__input_buffer[i+__xlx_offset_param_edges];
  }
  for (int i = 0; i < __xlx_size_param_edges; ++i) {
    ((long long*)__xlx_apatb_param_edges)[i] = __xlx_edges_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_level
  sc_bv<8>*__xlx_level_output_buffer = new sc_bv<8>[__xlx_size_param_level];
  for (int i = 0; i < __xlx_size_param_level; ++i) {
    __xlx_level_output_buffer[i] = __xlx_level__input_buffer[i+__xlx_offset_param_level];
  }
  for (int i = 0; i < __xlx_size_param_level; ++i) {
    ((char*)__xlx_apatb_param_level)[i] = __xlx_level_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_level_counts
  sc_bv<64>*__xlx_level_counts_output_buffer = new sc_bv<64>[__xlx_size_param_level_counts];
  for (int i = 0; i < __xlx_size_param_level_counts; ++i) {
    __xlx_level_counts_output_buffer[i] = __xlx_level_counts__input_buffer[i+__xlx_offset_param_level_counts];
  }
  for (int i = 0; i < __xlx_size_param_level_counts; ++i) {
    ((long long*)__xlx_apatb_param_level_counts)[i] = __xlx_level_counts_output_buffer[i].to_uint64();
  }
}
