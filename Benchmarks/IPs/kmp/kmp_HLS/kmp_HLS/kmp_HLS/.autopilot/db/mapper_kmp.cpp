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
extern "C" int kmp(char*, char*, int*, int*);
extern "C" int apatb_kmp_hw(volatile void * __xlx_apatb_param_pattern, volatile void * __xlx_apatb_param_input, volatile void * __xlx_apatb_param_kmpNext, volatile void * __xlx_apatb_param_n_matches) {
  // Collect __xlx_pattern__tmp_vec
  vector<sc_bv<8> >__xlx_pattern__tmp_vec;
  for (int j = 0, e = 4; j != e; ++j) {
    __xlx_pattern__tmp_vec.push_back(((char*)__xlx_apatb_param_pattern)[j]);
  }
  int __xlx_size_param_pattern = 4;
  int __xlx_offset_param_pattern = 0;
  int __xlx_offset_byte_param_pattern = 0*1;
  char* __xlx_pattern__input_buffer= new char[__xlx_pattern__tmp_vec.size()];
  for (int i = 0; i < __xlx_pattern__tmp_vec.size(); ++i) {
    __xlx_pattern__input_buffer[i] = __xlx_pattern__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_input__tmp_vec
  vector<sc_bv<8> >__xlx_input__tmp_vec;
  for (int j = 0, e = 32411; j != e; ++j) {
    __xlx_input__tmp_vec.push_back(((char*)__xlx_apatb_param_input)[j]);
  }
  int __xlx_size_param_input = 32411;
  int __xlx_offset_param_input = 0;
  int __xlx_offset_byte_param_input = 0*1;
  char* __xlx_input__input_buffer= new char[__xlx_input__tmp_vec.size()];
  for (int i = 0; i < __xlx_input__tmp_vec.size(); ++i) {
    __xlx_input__input_buffer[i] = __xlx_input__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_kmpNext__tmp_vec
  vector<sc_bv<32> >__xlx_kmpNext__tmp_vec;
  for (int j = 0, e = 4; j != e; ++j) {
    __xlx_kmpNext__tmp_vec.push_back(((int*)__xlx_apatb_param_kmpNext)[j]);
  }
  int __xlx_size_param_kmpNext = 4;
  int __xlx_offset_param_kmpNext = 0;
  int __xlx_offset_byte_param_kmpNext = 0*4;
  int* __xlx_kmpNext__input_buffer= new int[__xlx_kmpNext__tmp_vec.size()];
  for (int i = 0; i < __xlx_kmpNext__tmp_vec.size(); ++i) {
    __xlx_kmpNext__input_buffer[i] = __xlx_kmpNext__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_n_matches__tmp_vec
  vector<sc_bv<32> >__xlx_n_matches__tmp_vec;
  for (int j = 0, e = 1; j != e; ++j) {
    __xlx_n_matches__tmp_vec.push_back(((int*)__xlx_apatb_param_n_matches)[j]);
  }
  int __xlx_size_param_n_matches = 1;
  int __xlx_offset_param_n_matches = 0;
  int __xlx_offset_byte_param_n_matches = 0*4;
  int* __xlx_n_matches__input_buffer= new int[__xlx_n_matches__tmp_vec.size()];
  for (int i = 0; i < __xlx_n_matches__tmp_vec.size(); ++i) {
    __xlx_n_matches__input_buffer[i] = __xlx_n_matches__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  int ap_return = kmp(__xlx_pattern__input_buffer, __xlx_input__input_buffer, __xlx_kmpNext__input_buffer, __xlx_n_matches__input_buffer);
// print __xlx_apatb_param_pattern
  sc_bv<8>*__xlx_pattern_output_buffer = new sc_bv<8>[__xlx_size_param_pattern];
  for (int i = 0; i < __xlx_size_param_pattern; ++i) {
    __xlx_pattern_output_buffer[i] = __xlx_pattern__input_buffer[i+__xlx_offset_param_pattern];
  }
  for (int i = 0; i < __xlx_size_param_pattern; ++i) {
    ((char*)__xlx_apatb_param_pattern)[i] = __xlx_pattern_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_input
  sc_bv<8>*__xlx_input_output_buffer = new sc_bv<8>[__xlx_size_param_input];
  for (int i = 0; i < __xlx_size_param_input; ++i) {
    __xlx_input_output_buffer[i] = __xlx_input__input_buffer[i+__xlx_offset_param_input];
  }
  for (int i = 0; i < __xlx_size_param_input; ++i) {
    ((char*)__xlx_apatb_param_input)[i] = __xlx_input_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_kmpNext
  sc_bv<32>*__xlx_kmpNext_output_buffer = new sc_bv<32>[__xlx_size_param_kmpNext];
  for (int i = 0; i < __xlx_size_param_kmpNext; ++i) {
    __xlx_kmpNext_output_buffer[i] = __xlx_kmpNext__input_buffer[i+__xlx_offset_param_kmpNext];
  }
  for (int i = 0; i < __xlx_size_param_kmpNext; ++i) {
    ((int*)__xlx_apatb_param_kmpNext)[i] = __xlx_kmpNext_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_n_matches
  sc_bv<32>*__xlx_n_matches_output_buffer = new sc_bv<32>[__xlx_size_param_n_matches];
  for (int i = 0; i < __xlx_size_param_n_matches; ++i) {
    __xlx_n_matches_output_buffer[i] = __xlx_n_matches__input_buffer[i+__xlx_offset_param_n_matches];
  }
  for (int i = 0; i < __xlx_size_param_n_matches; ++i) {
    ((int*)__xlx_apatb_param_n_matches)[i] = __xlx_n_matches_output_buffer[i].to_uint64();
  }
return ap_return;
}
