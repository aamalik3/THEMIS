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
extern "C" void fft(long long*, long long*, long long*, long long*);
extern "C" void apatb_fft_hw(volatile void * __xlx_apatb_param_real, volatile void * __xlx_apatb_param_img, volatile void * __xlx_apatb_param_real_twid, volatile void * __xlx_apatb_param_img_twid) {
  // Collect __xlx_real__tmp_vec
  vector<sc_bv<64> >__xlx_real__tmp_vec;
  for (int j = 0, e = 1024; j != e; ++j) {
    __xlx_real__tmp_vec.push_back(((long long*)__xlx_apatb_param_real)[j]);
  }
  int __xlx_size_param_real = 1024;
  int __xlx_offset_param_real = 0;
  int __xlx_offset_byte_param_real = 0*8;
  long long* __xlx_real__input_buffer= new long long[__xlx_real__tmp_vec.size()];
  for (int i = 0; i < __xlx_real__tmp_vec.size(); ++i) {
    __xlx_real__input_buffer[i] = __xlx_real__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_img__tmp_vec
  vector<sc_bv<64> >__xlx_img__tmp_vec;
  for (int j = 0, e = 1024; j != e; ++j) {
    __xlx_img__tmp_vec.push_back(((long long*)__xlx_apatb_param_img)[j]);
  }
  int __xlx_size_param_img = 1024;
  int __xlx_offset_param_img = 0;
  int __xlx_offset_byte_param_img = 0*8;
  long long* __xlx_img__input_buffer= new long long[__xlx_img__tmp_vec.size()];
  for (int i = 0; i < __xlx_img__tmp_vec.size(); ++i) {
    __xlx_img__input_buffer[i] = __xlx_img__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_real_twid__tmp_vec
  vector<sc_bv<64> >__xlx_real_twid__tmp_vec;
  for (int j = 0, e = 512; j != e; ++j) {
    __xlx_real_twid__tmp_vec.push_back(((long long*)__xlx_apatb_param_real_twid)[j]);
  }
  int __xlx_size_param_real_twid = 512;
  int __xlx_offset_param_real_twid = 0;
  int __xlx_offset_byte_param_real_twid = 0*8;
  long long* __xlx_real_twid__input_buffer= new long long[__xlx_real_twid__tmp_vec.size()];
  for (int i = 0; i < __xlx_real_twid__tmp_vec.size(); ++i) {
    __xlx_real_twid__input_buffer[i] = __xlx_real_twid__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_img_twid__tmp_vec
  vector<sc_bv<64> >__xlx_img_twid__tmp_vec;
  for (int j = 0, e = 512; j != e; ++j) {
    __xlx_img_twid__tmp_vec.push_back(((long long*)__xlx_apatb_param_img_twid)[j]);
  }
  int __xlx_size_param_img_twid = 512;
  int __xlx_offset_param_img_twid = 0;
  int __xlx_offset_byte_param_img_twid = 0*8;
  long long* __xlx_img_twid__input_buffer= new long long[__xlx_img_twid__tmp_vec.size()];
  for (int i = 0; i < __xlx_img_twid__tmp_vec.size(); ++i) {
    __xlx_img_twid__input_buffer[i] = __xlx_img_twid__tmp_vec[i].range(63, 0).to_uint64();
  }
  // DUT call
  fft(__xlx_real__input_buffer, __xlx_img__input_buffer, __xlx_real_twid__input_buffer, __xlx_img_twid__input_buffer);
// print __xlx_apatb_param_real
  sc_bv<64>*__xlx_real_output_buffer = new sc_bv<64>[__xlx_size_param_real];
  for (int i = 0; i < __xlx_size_param_real; ++i) {
    __xlx_real_output_buffer[i] = __xlx_real__input_buffer[i+__xlx_offset_param_real];
  }
  for (int i = 0; i < __xlx_size_param_real; ++i) {
    ((long long*)__xlx_apatb_param_real)[i] = __xlx_real_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_img
  sc_bv<64>*__xlx_img_output_buffer = new sc_bv<64>[__xlx_size_param_img];
  for (int i = 0; i < __xlx_size_param_img; ++i) {
    __xlx_img_output_buffer[i] = __xlx_img__input_buffer[i+__xlx_offset_param_img];
  }
  for (int i = 0; i < __xlx_size_param_img; ++i) {
    ((long long*)__xlx_apatb_param_img)[i] = __xlx_img_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_real_twid
  sc_bv<64>*__xlx_real_twid_output_buffer = new sc_bv<64>[__xlx_size_param_real_twid];
  for (int i = 0; i < __xlx_size_param_real_twid; ++i) {
    __xlx_real_twid_output_buffer[i] = __xlx_real_twid__input_buffer[i+__xlx_offset_param_real_twid];
  }
  for (int i = 0; i < __xlx_size_param_real_twid; ++i) {
    ((long long*)__xlx_apatb_param_real_twid)[i] = __xlx_real_twid_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_img_twid
  sc_bv<64>*__xlx_img_twid_output_buffer = new sc_bv<64>[__xlx_size_param_img_twid];
  for (int i = 0; i < __xlx_size_param_img_twid; ++i) {
    __xlx_img_twid_output_buffer[i] = __xlx_img_twid__input_buffer[i+__xlx_offset_param_img_twid];
  }
  for (int i = 0; i < __xlx_size_param_img_twid; ++i) {
    ((long long*)__xlx_apatb_param_img_twid)[i] = __xlx_img_twid_output_buffer[i].to_uint64();
  }
}
