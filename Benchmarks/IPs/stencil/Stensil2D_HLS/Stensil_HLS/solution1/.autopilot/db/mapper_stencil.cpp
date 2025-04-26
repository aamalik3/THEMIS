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
extern "C" void stencil(int*, int*, int*);
extern "C" void apatb_stencil_hw(volatile void * __xlx_apatb_param_orig, volatile void * __xlx_apatb_param_sol, volatile void * __xlx_apatb_param_filter) {
  // Collect __xlx_orig__tmp_vec
  vector<sc_bv<32> >__xlx_orig__tmp_vec;
  for (int j = 0, e = 8192; j != e; ++j) {
    __xlx_orig__tmp_vec.push_back(((int*)__xlx_apatb_param_orig)[j]);
  }
  int __xlx_size_param_orig = 8192;
  int __xlx_offset_param_orig = 0;
  int __xlx_offset_byte_param_orig = 0*4;
  int* __xlx_orig__input_buffer= new int[__xlx_orig__tmp_vec.size()];
  for (int i = 0; i < __xlx_orig__tmp_vec.size(); ++i) {
    __xlx_orig__input_buffer[i] = __xlx_orig__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_sol__tmp_vec
  vector<sc_bv<32> >__xlx_sol__tmp_vec;
  for (int j = 0, e = 8192; j != e; ++j) {
    __xlx_sol__tmp_vec.push_back(((int*)__xlx_apatb_param_sol)[j]);
  }
  int __xlx_size_param_sol = 8192;
  int __xlx_offset_param_sol = 0;
  int __xlx_offset_byte_param_sol = 0*4;
  int* __xlx_sol__input_buffer= new int[__xlx_sol__tmp_vec.size()];
  for (int i = 0; i < __xlx_sol__tmp_vec.size(); ++i) {
    __xlx_sol__input_buffer[i] = __xlx_sol__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_filter__tmp_vec
  vector<sc_bv<32> >__xlx_filter__tmp_vec;
  for (int j = 0, e = 9; j != e; ++j) {
    __xlx_filter__tmp_vec.push_back(((int*)__xlx_apatb_param_filter)[j]);
  }
  int __xlx_size_param_filter = 9;
  int __xlx_offset_param_filter = 0;
  int __xlx_offset_byte_param_filter = 0*4;
  int* __xlx_filter__input_buffer= new int[__xlx_filter__tmp_vec.size()];
  for (int i = 0; i < __xlx_filter__tmp_vec.size(); ++i) {
    __xlx_filter__input_buffer[i] = __xlx_filter__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  stencil(__xlx_orig__input_buffer, __xlx_sol__input_buffer, __xlx_filter__input_buffer);
// print __xlx_apatb_param_orig
  sc_bv<32>*__xlx_orig_output_buffer = new sc_bv<32>[__xlx_size_param_orig];
  for (int i = 0; i < __xlx_size_param_orig; ++i) {
    __xlx_orig_output_buffer[i] = __xlx_orig__input_buffer[i+__xlx_offset_param_orig];
  }
  for (int i = 0; i < __xlx_size_param_orig; ++i) {
    ((int*)__xlx_apatb_param_orig)[i] = __xlx_orig_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_sol
  sc_bv<32>*__xlx_sol_output_buffer = new sc_bv<32>[__xlx_size_param_sol];
  for (int i = 0; i < __xlx_size_param_sol; ++i) {
    __xlx_sol_output_buffer[i] = __xlx_sol__input_buffer[i+__xlx_offset_param_sol];
  }
  for (int i = 0; i < __xlx_size_param_sol; ++i) {
    ((int*)__xlx_apatb_param_sol)[i] = __xlx_sol_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_filter
  sc_bv<32>*__xlx_filter_output_buffer = new sc_bv<32>[__xlx_size_param_filter];
  for (int i = 0; i < __xlx_size_param_filter; ++i) {
    __xlx_filter_output_buffer[i] = __xlx_filter__input_buffer[i+__xlx_offset_param_filter];
  }
  for (int i = 0; i < __xlx_size_param_filter; ++i) {
    ((int*)__xlx_apatb_param_filter)[i] = __xlx_filter_output_buffer[i].to_uint64();
  }
}
