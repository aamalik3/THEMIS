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
extern "C" void spmv(long long*, int*, int*, long long*, long long*);
extern "C" void apatb_spmv_hw(volatile void * __xlx_apatb_param_val, volatile void * __xlx_apatb_param_cols, volatile void * __xlx_apatb_param_rowDelimiters, volatile void * __xlx_apatb_param_vec, volatile void * __xlx_apatb_param_out) {
  // Collect __xlx_val__tmp_vec
  vector<sc_bv<64> >__xlx_val__tmp_vec;
  for (int j = 0, e = 1666; j != e; ++j) {
    __xlx_val__tmp_vec.push_back(((long long*)__xlx_apatb_param_val)[j]);
  }
  int __xlx_size_param_val = 1666;
  int __xlx_offset_param_val = 0;
  int __xlx_offset_byte_param_val = 0*8;
  long long* __xlx_val__input_buffer= new long long[__xlx_val__tmp_vec.size()];
  for (int i = 0; i < __xlx_val__tmp_vec.size(); ++i) {
    __xlx_val__input_buffer[i] = __xlx_val__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_cols__tmp_vec
  vector<sc_bv<32> >__xlx_cols__tmp_vec;
  for (int j = 0, e = 1666; j != e; ++j) {
    __xlx_cols__tmp_vec.push_back(((int*)__xlx_apatb_param_cols)[j]);
  }
  int __xlx_size_param_cols = 1666;
  int __xlx_offset_param_cols = 0;
  int __xlx_offset_byte_param_cols = 0*4;
  int* __xlx_cols__input_buffer= new int[__xlx_cols__tmp_vec.size()];
  for (int i = 0; i < __xlx_cols__tmp_vec.size(); ++i) {
    __xlx_cols__input_buffer[i] = __xlx_cols__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_rowDelimiters__tmp_vec
  vector<sc_bv<32> >__xlx_rowDelimiters__tmp_vec;
  for (int j = 0, e = 495; j != e; ++j) {
    __xlx_rowDelimiters__tmp_vec.push_back(((int*)__xlx_apatb_param_rowDelimiters)[j]);
  }
  int __xlx_size_param_rowDelimiters = 495;
  int __xlx_offset_param_rowDelimiters = 0;
  int __xlx_offset_byte_param_rowDelimiters = 0*4;
  int* __xlx_rowDelimiters__input_buffer= new int[__xlx_rowDelimiters__tmp_vec.size()];
  for (int i = 0; i < __xlx_rowDelimiters__tmp_vec.size(); ++i) {
    __xlx_rowDelimiters__input_buffer[i] = __xlx_rowDelimiters__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_vec__tmp_vec
  vector<sc_bv<64> >__xlx_vec__tmp_vec;
  for (int j = 0, e = 494; j != e; ++j) {
    __xlx_vec__tmp_vec.push_back(((long long*)__xlx_apatb_param_vec)[j]);
  }
  int __xlx_size_param_vec = 494;
  int __xlx_offset_param_vec = 0;
  int __xlx_offset_byte_param_vec = 0*8;
  long long* __xlx_vec__input_buffer= new long long[__xlx_vec__tmp_vec.size()];
  for (int i = 0; i < __xlx_vec__tmp_vec.size(); ++i) {
    __xlx_vec__input_buffer[i] = __xlx_vec__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_out__tmp_vec
  vector<sc_bv<64> >__xlx_out__tmp_vec;
  for (int j = 0, e = 494; j != e; ++j) {
    __xlx_out__tmp_vec.push_back(((long long*)__xlx_apatb_param_out)[j]);
  }
  int __xlx_size_param_out = 494;
  int __xlx_offset_param_out = 0;
  int __xlx_offset_byte_param_out = 0*8;
  long long* __xlx_out__input_buffer= new long long[__xlx_out__tmp_vec.size()];
  for (int i = 0; i < __xlx_out__tmp_vec.size(); ++i) {
    __xlx_out__input_buffer[i] = __xlx_out__tmp_vec[i].range(63, 0).to_uint64();
  }
  // DUT call
  spmv(__xlx_val__input_buffer, __xlx_cols__input_buffer, __xlx_rowDelimiters__input_buffer, __xlx_vec__input_buffer, __xlx_out__input_buffer);
// print __xlx_apatb_param_val
  sc_bv<64>*__xlx_val_output_buffer = new sc_bv<64>[__xlx_size_param_val];
  for (int i = 0; i < __xlx_size_param_val; ++i) {
    __xlx_val_output_buffer[i] = __xlx_val__input_buffer[i+__xlx_offset_param_val];
  }
  for (int i = 0; i < __xlx_size_param_val; ++i) {
    ((long long*)__xlx_apatb_param_val)[i] = __xlx_val_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_cols
  sc_bv<32>*__xlx_cols_output_buffer = new sc_bv<32>[__xlx_size_param_cols];
  for (int i = 0; i < __xlx_size_param_cols; ++i) {
    __xlx_cols_output_buffer[i] = __xlx_cols__input_buffer[i+__xlx_offset_param_cols];
  }
  for (int i = 0; i < __xlx_size_param_cols; ++i) {
    ((int*)__xlx_apatb_param_cols)[i] = __xlx_cols_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_rowDelimiters
  sc_bv<32>*__xlx_rowDelimiters_output_buffer = new sc_bv<32>[__xlx_size_param_rowDelimiters];
  for (int i = 0; i < __xlx_size_param_rowDelimiters; ++i) {
    __xlx_rowDelimiters_output_buffer[i] = __xlx_rowDelimiters__input_buffer[i+__xlx_offset_param_rowDelimiters];
  }
  for (int i = 0; i < __xlx_size_param_rowDelimiters; ++i) {
    ((int*)__xlx_apatb_param_rowDelimiters)[i] = __xlx_rowDelimiters_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_vec
  sc_bv<64>*__xlx_vec_output_buffer = new sc_bv<64>[__xlx_size_param_vec];
  for (int i = 0; i < __xlx_size_param_vec; ++i) {
    __xlx_vec_output_buffer[i] = __xlx_vec__input_buffer[i+__xlx_offset_param_vec];
  }
  for (int i = 0; i < __xlx_size_param_vec; ++i) {
    ((long long*)__xlx_apatb_param_vec)[i] = __xlx_vec_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_out
  sc_bv<64>*__xlx_out_output_buffer = new sc_bv<64>[__xlx_size_param_out];
  for (int i = 0; i < __xlx_size_param_out; ++i) {
    __xlx_out_output_buffer[i] = __xlx_out__input_buffer[i+__xlx_offset_param_out];
  }
  for (int i = 0; i < __xlx_size_param_out; ++i) {
    ((long long*)__xlx_apatb_param_out)[i] = __xlx_out_output_buffer[i].to_uint64();
  }
}
