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
extern "C" void bbgemm(long long*, long long*, long long*);
extern "C" void apatb_bbgemm_hw(volatile void * __xlx_apatb_param_m1, volatile void * __xlx_apatb_param_m2, volatile void * __xlx_apatb_param_prod) {
  // Collect __xlx_m1__tmp_vec
  vector<sc_bv<64> >__xlx_m1__tmp_vec;
  for (int j = 0, e = 4096; j != e; ++j) {
    __xlx_m1__tmp_vec.push_back(((long long*)__xlx_apatb_param_m1)[j]);
  }
  int __xlx_size_param_m1 = 4096;
  int __xlx_offset_param_m1 = 0;
  int __xlx_offset_byte_param_m1 = 0*8;
  long long* __xlx_m1__input_buffer= new long long[__xlx_m1__tmp_vec.size()];
  for (int i = 0; i < __xlx_m1__tmp_vec.size(); ++i) {
    __xlx_m1__input_buffer[i] = __xlx_m1__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_m2__tmp_vec
  vector<sc_bv<64> >__xlx_m2__tmp_vec;
  for (int j = 0, e = 4096; j != e; ++j) {
    __xlx_m2__tmp_vec.push_back(((long long*)__xlx_apatb_param_m2)[j]);
  }
  int __xlx_size_param_m2 = 4096;
  int __xlx_offset_param_m2 = 0;
  int __xlx_offset_byte_param_m2 = 0*8;
  long long* __xlx_m2__input_buffer= new long long[__xlx_m2__tmp_vec.size()];
  for (int i = 0; i < __xlx_m2__tmp_vec.size(); ++i) {
    __xlx_m2__input_buffer[i] = __xlx_m2__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_prod__tmp_vec
  vector<sc_bv<64> >__xlx_prod__tmp_vec;
  for (int j = 0, e = 4096; j != e; ++j) {
    __xlx_prod__tmp_vec.push_back(((long long*)__xlx_apatb_param_prod)[j]);
  }
  int __xlx_size_param_prod = 4096;
  int __xlx_offset_param_prod = 0;
  int __xlx_offset_byte_param_prod = 0*8;
  long long* __xlx_prod__input_buffer= new long long[__xlx_prod__tmp_vec.size()];
  for (int i = 0; i < __xlx_prod__tmp_vec.size(); ++i) {
    __xlx_prod__input_buffer[i] = __xlx_prod__tmp_vec[i].range(63, 0).to_uint64();
  }
  // DUT call
  bbgemm(__xlx_m1__input_buffer, __xlx_m2__input_buffer, __xlx_prod__input_buffer);
// print __xlx_apatb_param_m1
  sc_bv<64>*__xlx_m1_output_buffer = new sc_bv<64>[__xlx_size_param_m1];
  for (int i = 0; i < __xlx_size_param_m1; ++i) {
    __xlx_m1_output_buffer[i] = __xlx_m1__input_buffer[i+__xlx_offset_param_m1];
  }
  for (int i = 0; i < __xlx_size_param_m1; ++i) {
    ((long long*)__xlx_apatb_param_m1)[i] = __xlx_m1_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_m2
  sc_bv<64>*__xlx_m2_output_buffer = new sc_bv<64>[__xlx_size_param_m2];
  for (int i = 0; i < __xlx_size_param_m2; ++i) {
    __xlx_m2_output_buffer[i] = __xlx_m2__input_buffer[i+__xlx_offset_param_m2];
  }
  for (int i = 0; i < __xlx_size_param_m2; ++i) {
    ((long long*)__xlx_apatb_param_m2)[i] = __xlx_m2_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_prod
  sc_bv<64>*__xlx_prod_output_buffer = new sc_bv<64>[__xlx_size_param_prod];
  for (int i = 0; i < __xlx_size_param_prod; ++i) {
    __xlx_prod_output_buffer[i] = __xlx_prod__input_buffer[i+__xlx_offset_param_prod];
  }
  for (int i = 0; i < __xlx_size_param_prod; ++i) {
    ((long long*)__xlx_apatb_param_prod)[i] = __xlx_prod_output_buffer[i].to_uint64();
  }
}
