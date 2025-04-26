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
struct __cosim_s18__ { char data[24]; };
extern "C" void md(int*, __cosim_s18__*, __cosim_s18__*);
extern "C" void apatb_md_hw(volatile void * __xlx_apatb_param_n_points, volatile void * __xlx_apatb_param_force, volatile void * __xlx_apatb_param_position) {
  // Collect __xlx_n_points__tmp_vec
  vector<sc_bv<32> >__xlx_n_points__tmp_vec;
  for (int j = 0, e = 64; j != e; ++j) {
    __xlx_n_points__tmp_vec.push_back(((int*)__xlx_apatb_param_n_points)[j]);
  }
  int __xlx_size_param_n_points = 64;
  int __xlx_offset_param_n_points = 0;
  int __xlx_offset_byte_param_n_points = 0*4;
  int* __xlx_n_points__input_buffer= new int[__xlx_n_points__tmp_vec.size()];
  for (int i = 0; i < __xlx_n_points__tmp_vec.size(); ++i) {
    __xlx_n_points__input_buffer[i] = __xlx_n_points__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_force__tmp_vec
  vector<sc_bv<192> >__xlx_force__tmp_vec;
  for (int j = 0, e = 640; j != e; ++j) {
    sc_bv<192> _xlx_tmp_sc;
    _xlx_tmp_sc.range(63, 0) = ((long long*)__xlx_apatb_param_force)[j*3+0];
    _xlx_tmp_sc.range(127, 64) = ((long long*)__xlx_apatb_param_force)[j*3+1];
    _xlx_tmp_sc.range(191, 128) = ((long long*)__xlx_apatb_param_force)[j*3+2];
    __xlx_force__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_force = 640;
  int __xlx_offset_param_force = 0;
  int __xlx_offset_byte_param_force = 0*24;
  __cosim_s18__* __xlx_force__input_buffer= new __cosim_s18__[__xlx_force__tmp_vec.size()];
  for (int i = 0; i < __xlx_force__tmp_vec.size(); ++i) {
    ((long long*)__xlx_force__input_buffer)[i*3+0] = __xlx_force__tmp_vec[i].range(63, 0).to_uint64();
    ((long long*)__xlx_force__input_buffer)[i*3+1] = __xlx_force__tmp_vec[i].range(127, 64).to_uint64();
    ((long long*)__xlx_force__input_buffer)[i*3+2] = __xlx_force__tmp_vec[i].range(191, 128).to_uint64();
  }
  // Collect __xlx_position__tmp_vec
  vector<sc_bv<192> >__xlx_position__tmp_vec;
  for (int j = 0, e = 640; j != e; ++j) {
    sc_bv<192> _xlx_tmp_sc;
    _xlx_tmp_sc.range(63, 0) = ((long long*)__xlx_apatb_param_position)[j*3+0];
    _xlx_tmp_sc.range(127, 64) = ((long long*)__xlx_apatb_param_position)[j*3+1];
    _xlx_tmp_sc.range(191, 128) = ((long long*)__xlx_apatb_param_position)[j*3+2];
    __xlx_position__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_position = 640;
  int __xlx_offset_param_position = 0;
  int __xlx_offset_byte_param_position = 0*24;
  __cosim_s18__* __xlx_position__input_buffer= new __cosim_s18__[__xlx_position__tmp_vec.size()];
  for (int i = 0; i < __xlx_position__tmp_vec.size(); ++i) {
    ((long long*)__xlx_position__input_buffer)[i*3+0] = __xlx_position__tmp_vec[i].range(63, 0).to_uint64();
    ((long long*)__xlx_position__input_buffer)[i*3+1] = __xlx_position__tmp_vec[i].range(127, 64).to_uint64();
    ((long long*)__xlx_position__input_buffer)[i*3+2] = __xlx_position__tmp_vec[i].range(191, 128).to_uint64();
  }
  // DUT call
  md(__xlx_n_points__input_buffer, __xlx_force__input_buffer, __xlx_position__input_buffer);
// print __xlx_apatb_param_n_points
  sc_bv<32>*__xlx_n_points_output_buffer = new sc_bv<32>[__xlx_size_param_n_points];
  for (int i = 0; i < __xlx_size_param_n_points; ++i) {
    __xlx_n_points_output_buffer[i] = __xlx_n_points__input_buffer[i+__xlx_offset_param_n_points];
  }
  for (int i = 0; i < __xlx_size_param_n_points; ++i) {
    ((int*)__xlx_apatb_param_n_points)[i] = __xlx_n_points_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_force
  sc_bv<192>*__xlx_force_output_buffer = new sc_bv<192>[__xlx_size_param_force];
  for (int i = 0; i < __xlx_size_param_force; ++i) {
    char* start = (char*)(&(__xlx_force__input_buffer[__xlx_offset_param_force]));
    __xlx_force_output_buffer[i].range(63, 0) = ((long long*)start)[i*3+0];
    __xlx_force_output_buffer[i].range(127, 64) = ((long long*)start)[i*3+1];
    __xlx_force_output_buffer[i].range(191, 128) = ((long long*)start)[i*3+2];
  }
  for (int i = 0; i < __xlx_size_param_force; ++i) {
    ((long long*)__xlx_apatb_param_force)[i*3+0] = __xlx_force_output_buffer[i].range(63, 0).to_uint64();
    ((long long*)__xlx_apatb_param_force)[i*3+1] = __xlx_force_output_buffer[i].range(127, 64).to_uint64();
    ((long long*)__xlx_apatb_param_force)[i*3+2] = __xlx_force_output_buffer[i].range(191, 128).to_uint64();
  }
// print __xlx_apatb_param_position
  sc_bv<192>*__xlx_position_output_buffer = new sc_bv<192>[__xlx_size_param_position];
  for (int i = 0; i < __xlx_size_param_position; ++i) {
    char* start = (char*)(&(__xlx_position__input_buffer[__xlx_offset_param_position]));
    __xlx_position_output_buffer[i].range(63, 0) = ((long long*)start)[i*3+0];
    __xlx_position_output_buffer[i].range(127, 64) = ((long long*)start)[i*3+1];
    __xlx_position_output_buffer[i].range(191, 128) = ((long long*)start)[i*3+2];
  }
  for (int i = 0; i < __xlx_size_param_position; ++i) {
    ((long long*)__xlx_apatb_param_position)[i*3+0] = __xlx_position_output_buffer[i].range(63, 0).to_uint64();
    ((long long*)__xlx_apatb_param_position)[i*3+1] = __xlx_position_output_buffer[i].range(127, 64).to_uint64();
    ((long long*)__xlx_apatb_param_position)[i*3+2] = __xlx_position_output_buffer[i].range(191, 128).to_uint64();
  }
}
