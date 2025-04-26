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
extern "C" int viterbi(char*, long long*, long long*, long long*, char*);
extern "C" int apatb_viterbi_hw(volatile void * __xlx_apatb_param_obs, volatile void * __xlx_apatb_param_init, volatile void * __xlx_apatb_param_transition, volatile void * __xlx_apatb_param_emission, volatile void * __xlx_apatb_param_path) {
  // Collect __xlx_obs__tmp_vec
  vector<sc_bv<8> >__xlx_obs__tmp_vec;
  for (int j = 0, e = 140; j != e; ++j) {
    __xlx_obs__tmp_vec.push_back(((char*)__xlx_apatb_param_obs)[j]);
  }
  int __xlx_size_param_obs = 140;
  int __xlx_offset_param_obs = 0;
  int __xlx_offset_byte_param_obs = 0*1;
  char* __xlx_obs__input_buffer= new char[__xlx_obs__tmp_vec.size()];
  for (int i = 0; i < __xlx_obs__tmp_vec.size(); ++i) {
    __xlx_obs__input_buffer[i] = __xlx_obs__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_init__tmp_vec
  vector<sc_bv<64> >__xlx_init__tmp_vec;
  for (int j = 0, e = 64; j != e; ++j) {
    __xlx_init__tmp_vec.push_back(((long long*)__xlx_apatb_param_init)[j]);
  }
  int __xlx_size_param_init = 64;
  int __xlx_offset_param_init = 0;
  int __xlx_offset_byte_param_init = 0*8;
  long long* __xlx_init__input_buffer= new long long[__xlx_init__tmp_vec.size()];
  for (int i = 0; i < __xlx_init__tmp_vec.size(); ++i) {
    __xlx_init__input_buffer[i] = __xlx_init__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_transition__tmp_vec
  vector<sc_bv<64> >__xlx_transition__tmp_vec;
  for (int j = 0, e = 4096; j != e; ++j) {
    __xlx_transition__tmp_vec.push_back(((long long*)__xlx_apatb_param_transition)[j]);
  }
  int __xlx_size_param_transition = 4096;
  int __xlx_offset_param_transition = 0;
  int __xlx_offset_byte_param_transition = 0*8;
  long long* __xlx_transition__input_buffer= new long long[__xlx_transition__tmp_vec.size()];
  for (int i = 0; i < __xlx_transition__tmp_vec.size(); ++i) {
    __xlx_transition__input_buffer[i] = __xlx_transition__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_emission__tmp_vec
  vector<sc_bv<64> >__xlx_emission__tmp_vec;
  for (int j = 0, e = 4096; j != e; ++j) {
    __xlx_emission__tmp_vec.push_back(((long long*)__xlx_apatb_param_emission)[j]);
  }
  int __xlx_size_param_emission = 4096;
  int __xlx_offset_param_emission = 0;
  int __xlx_offset_byte_param_emission = 0*8;
  long long* __xlx_emission__input_buffer= new long long[__xlx_emission__tmp_vec.size()];
  for (int i = 0; i < __xlx_emission__tmp_vec.size(); ++i) {
    __xlx_emission__input_buffer[i] = __xlx_emission__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_path__tmp_vec
  vector<sc_bv<8> >__xlx_path__tmp_vec;
  for (int j = 0, e = 140; j != e; ++j) {
    __xlx_path__tmp_vec.push_back(((char*)__xlx_apatb_param_path)[j]);
  }
  int __xlx_size_param_path = 140;
  int __xlx_offset_param_path = 0;
  int __xlx_offset_byte_param_path = 0*1;
  char* __xlx_path__input_buffer= new char[__xlx_path__tmp_vec.size()];
  for (int i = 0; i < __xlx_path__tmp_vec.size(); ++i) {
    __xlx_path__input_buffer[i] = __xlx_path__tmp_vec[i].range(7, 0).to_uint64();
  }
  // DUT call
  int ap_return = viterbi(__xlx_obs__input_buffer, __xlx_init__input_buffer, __xlx_transition__input_buffer, __xlx_emission__input_buffer, __xlx_path__input_buffer);
// print __xlx_apatb_param_obs
  sc_bv<8>*__xlx_obs_output_buffer = new sc_bv<8>[__xlx_size_param_obs];
  for (int i = 0; i < __xlx_size_param_obs; ++i) {
    __xlx_obs_output_buffer[i] = __xlx_obs__input_buffer[i+__xlx_offset_param_obs];
  }
  for (int i = 0; i < __xlx_size_param_obs; ++i) {
    ((char*)__xlx_apatb_param_obs)[i] = __xlx_obs_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_init
  sc_bv<64>*__xlx_init_output_buffer = new sc_bv<64>[__xlx_size_param_init];
  for (int i = 0; i < __xlx_size_param_init; ++i) {
    __xlx_init_output_buffer[i] = __xlx_init__input_buffer[i+__xlx_offset_param_init];
  }
  for (int i = 0; i < __xlx_size_param_init; ++i) {
    ((long long*)__xlx_apatb_param_init)[i] = __xlx_init_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_transition
  sc_bv<64>*__xlx_transition_output_buffer = new sc_bv<64>[__xlx_size_param_transition];
  for (int i = 0; i < __xlx_size_param_transition; ++i) {
    __xlx_transition_output_buffer[i] = __xlx_transition__input_buffer[i+__xlx_offset_param_transition];
  }
  for (int i = 0; i < __xlx_size_param_transition; ++i) {
    ((long long*)__xlx_apatb_param_transition)[i] = __xlx_transition_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_emission
  sc_bv<64>*__xlx_emission_output_buffer = new sc_bv<64>[__xlx_size_param_emission];
  for (int i = 0; i < __xlx_size_param_emission; ++i) {
    __xlx_emission_output_buffer[i] = __xlx_emission__input_buffer[i+__xlx_offset_param_emission];
  }
  for (int i = 0; i < __xlx_size_param_emission; ++i) {
    ((long long*)__xlx_apatb_param_emission)[i] = __xlx_emission_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_path
  sc_bv<8>*__xlx_path_output_buffer = new sc_bv<8>[__xlx_size_param_path];
  for (int i = 0; i < __xlx_size_param_path; ++i) {
    __xlx_path_output_buffer[i] = __xlx_path__input_buffer[i+__xlx_offset_param_path];
  }
  for (int i = 0; i < __xlx_size_param_path; ++i) {
    ((char*)__xlx_apatb_param_path)[i] = __xlx_path_output_buffer[i].to_uint64();
  }
return ap_return;
}
