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
extern "C" void backprop(long long*, long long*, long long*, long long*, long long*, long long*, long long*, long long*);
extern "C" void apatb_backprop_hw(volatile void * __xlx_apatb_param_weights1, volatile void * __xlx_apatb_param_weights2, volatile void * __xlx_apatb_param_weights3, volatile void * __xlx_apatb_param_biases1, volatile void * __xlx_apatb_param_biases2, volatile void * __xlx_apatb_param_biases3, volatile void * __xlx_apatb_param_training_data, volatile void * __xlx_apatb_param_training_targets) {
  // Collect __xlx_weights1__tmp_vec
  vector<sc_bv<64> >__xlx_weights1__tmp_vec;
  for (int j = 0, e = 832; j != e; ++j) {
    __xlx_weights1__tmp_vec.push_back(((long long*)__xlx_apatb_param_weights1)[j]);
  }
  int __xlx_size_param_weights1 = 832;
  int __xlx_offset_param_weights1 = 0;
  int __xlx_offset_byte_param_weights1 = 0*8;
  long long* __xlx_weights1__input_buffer= new long long[__xlx_weights1__tmp_vec.size()];
  for (int i = 0; i < __xlx_weights1__tmp_vec.size(); ++i) {
    __xlx_weights1__input_buffer[i] = __xlx_weights1__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_weights2__tmp_vec
  vector<sc_bv<64> >__xlx_weights2__tmp_vec;
  for (int j = 0, e = 4096; j != e; ++j) {
    __xlx_weights2__tmp_vec.push_back(((long long*)__xlx_apatb_param_weights2)[j]);
  }
  int __xlx_size_param_weights2 = 4096;
  int __xlx_offset_param_weights2 = 0;
  int __xlx_offset_byte_param_weights2 = 0*8;
  long long* __xlx_weights2__input_buffer= new long long[__xlx_weights2__tmp_vec.size()];
  for (int i = 0; i < __xlx_weights2__tmp_vec.size(); ++i) {
    __xlx_weights2__input_buffer[i] = __xlx_weights2__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_weights3__tmp_vec
  vector<sc_bv<64> >__xlx_weights3__tmp_vec;
  for (int j = 0, e = 192; j != e; ++j) {
    __xlx_weights3__tmp_vec.push_back(((long long*)__xlx_apatb_param_weights3)[j]);
  }
  int __xlx_size_param_weights3 = 192;
  int __xlx_offset_param_weights3 = 0;
  int __xlx_offset_byte_param_weights3 = 0*8;
  long long* __xlx_weights3__input_buffer= new long long[__xlx_weights3__tmp_vec.size()];
  for (int i = 0; i < __xlx_weights3__tmp_vec.size(); ++i) {
    __xlx_weights3__input_buffer[i] = __xlx_weights3__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_biases1__tmp_vec
  vector<sc_bv<64> >__xlx_biases1__tmp_vec;
  for (int j = 0, e = 64; j != e; ++j) {
    __xlx_biases1__tmp_vec.push_back(((long long*)__xlx_apatb_param_biases1)[j]);
  }
  int __xlx_size_param_biases1 = 64;
  int __xlx_offset_param_biases1 = 0;
  int __xlx_offset_byte_param_biases1 = 0*8;
  long long* __xlx_biases1__input_buffer= new long long[__xlx_biases1__tmp_vec.size()];
  for (int i = 0; i < __xlx_biases1__tmp_vec.size(); ++i) {
    __xlx_biases1__input_buffer[i] = __xlx_biases1__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_biases2__tmp_vec
  vector<sc_bv<64> >__xlx_biases2__tmp_vec;
  for (int j = 0, e = 64; j != e; ++j) {
    __xlx_biases2__tmp_vec.push_back(((long long*)__xlx_apatb_param_biases2)[j]);
  }
  int __xlx_size_param_biases2 = 64;
  int __xlx_offset_param_biases2 = 0;
  int __xlx_offset_byte_param_biases2 = 0*8;
  long long* __xlx_biases2__input_buffer= new long long[__xlx_biases2__tmp_vec.size()];
  for (int i = 0; i < __xlx_biases2__tmp_vec.size(); ++i) {
    __xlx_biases2__input_buffer[i] = __xlx_biases2__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_biases3__tmp_vec
  vector<sc_bv<64> >__xlx_biases3__tmp_vec;
  for (int j = 0, e = 3; j != e; ++j) {
    __xlx_biases3__tmp_vec.push_back(((long long*)__xlx_apatb_param_biases3)[j]);
  }
  int __xlx_size_param_biases3 = 3;
  int __xlx_offset_param_biases3 = 0;
  int __xlx_offset_byte_param_biases3 = 0*8;
  long long* __xlx_biases3__input_buffer= new long long[__xlx_biases3__tmp_vec.size()];
  for (int i = 0; i < __xlx_biases3__tmp_vec.size(); ++i) {
    __xlx_biases3__input_buffer[i] = __xlx_biases3__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_training_data__tmp_vec
  vector<sc_bv<64> >__xlx_training_data__tmp_vec;
  for (int j = 0, e = 2119; j != e; ++j) {
    __xlx_training_data__tmp_vec.push_back(((long long*)__xlx_apatb_param_training_data)[j]);
  }
  int __xlx_size_param_training_data = 2119;
  int __xlx_offset_param_training_data = 0;
  int __xlx_offset_byte_param_training_data = 0*8;
  long long* __xlx_training_data__input_buffer= new long long[__xlx_training_data__tmp_vec.size()];
  for (int i = 0; i < __xlx_training_data__tmp_vec.size(); ++i) {
    __xlx_training_data__input_buffer[i] = __xlx_training_data__tmp_vec[i].range(63, 0).to_uint64();
  }
  // Collect __xlx_training_targets__tmp_vec
  vector<sc_bv<64> >__xlx_training_targets__tmp_vec;
  for (int j = 0, e = 489; j != e; ++j) {
    __xlx_training_targets__tmp_vec.push_back(((long long*)__xlx_apatb_param_training_targets)[j]);
  }
  int __xlx_size_param_training_targets = 489;
  int __xlx_offset_param_training_targets = 0;
  int __xlx_offset_byte_param_training_targets = 0*8;
  long long* __xlx_training_targets__input_buffer= new long long[__xlx_training_targets__tmp_vec.size()];
  for (int i = 0; i < __xlx_training_targets__tmp_vec.size(); ++i) {
    __xlx_training_targets__input_buffer[i] = __xlx_training_targets__tmp_vec[i].range(63, 0).to_uint64();
  }
  // DUT call
  backprop(__xlx_weights1__input_buffer, __xlx_weights2__input_buffer, __xlx_weights3__input_buffer, __xlx_biases1__input_buffer, __xlx_biases2__input_buffer, __xlx_biases3__input_buffer, __xlx_training_data__input_buffer, __xlx_training_targets__input_buffer);
// print __xlx_apatb_param_weights1
  sc_bv<64>*__xlx_weights1_output_buffer = new sc_bv<64>[__xlx_size_param_weights1];
  for (int i = 0; i < __xlx_size_param_weights1; ++i) {
    __xlx_weights1_output_buffer[i] = __xlx_weights1__input_buffer[i+__xlx_offset_param_weights1];
  }
  for (int i = 0; i < __xlx_size_param_weights1; ++i) {
    ((long long*)__xlx_apatb_param_weights1)[i] = __xlx_weights1_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_weights2
  sc_bv<64>*__xlx_weights2_output_buffer = new sc_bv<64>[__xlx_size_param_weights2];
  for (int i = 0; i < __xlx_size_param_weights2; ++i) {
    __xlx_weights2_output_buffer[i] = __xlx_weights2__input_buffer[i+__xlx_offset_param_weights2];
  }
  for (int i = 0; i < __xlx_size_param_weights2; ++i) {
    ((long long*)__xlx_apatb_param_weights2)[i] = __xlx_weights2_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_weights3
  sc_bv<64>*__xlx_weights3_output_buffer = new sc_bv<64>[__xlx_size_param_weights3];
  for (int i = 0; i < __xlx_size_param_weights3; ++i) {
    __xlx_weights3_output_buffer[i] = __xlx_weights3__input_buffer[i+__xlx_offset_param_weights3];
  }
  for (int i = 0; i < __xlx_size_param_weights3; ++i) {
    ((long long*)__xlx_apatb_param_weights3)[i] = __xlx_weights3_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_biases1
  sc_bv<64>*__xlx_biases1_output_buffer = new sc_bv<64>[__xlx_size_param_biases1];
  for (int i = 0; i < __xlx_size_param_biases1; ++i) {
    __xlx_biases1_output_buffer[i] = __xlx_biases1__input_buffer[i+__xlx_offset_param_biases1];
  }
  for (int i = 0; i < __xlx_size_param_biases1; ++i) {
    ((long long*)__xlx_apatb_param_biases1)[i] = __xlx_biases1_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_biases2
  sc_bv<64>*__xlx_biases2_output_buffer = new sc_bv<64>[__xlx_size_param_biases2];
  for (int i = 0; i < __xlx_size_param_biases2; ++i) {
    __xlx_biases2_output_buffer[i] = __xlx_biases2__input_buffer[i+__xlx_offset_param_biases2];
  }
  for (int i = 0; i < __xlx_size_param_biases2; ++i) {
    ((long long*)__xlx_apatb_param_biases2)[i] = __xlx_biases2_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_biases3
  sc_bv<64>*__xlx_biases3_output_buffer = new sc_bv<64>[__xlx_size_param_biases3];
  for (int i = 0; i < __xlx_size_param_biases3; ++i) {
    __xlx_biases3_output_buffer[i] = __xlx_biases3__input_buffer[i+__xlx_offset_param_biases3];
  }
  for (int i = 0; i < __xlx_size_param_biases3; ++i) {
    ((long long*)__xlx_apatb_param_biases3)[i] = __xlx_biases3_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_training_data
  sc_bv<64>*__xlx_training_data_output_buffer = new sc_bv<64>[__xlx_size_param_training_data];
  for (int i = 0; i < __xlx_size_param_training_data; ++i) {
    __xlx_training_data_output_buffer[i] = __xlx_training_data__input_buffer[i+__xlx_offset_param_training_data];
  }
  for (int i = 0; i < __xlx_size_param_training_data; ++i) {
    ((long long*)__xlx_apatb_param_training_data)[i] = __xlx_training_data_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_training_targets
  sc_bv<64>*__xlx_training_targets_output_buffer = new sc_bv<64>[__xlx_size_param_training_targets];
  for (int i = 0; i < __xlx_size_param_training_targets; ++i) {
    __xlx_training_targets_output_buffer[i] = __xlx_training_targets__input_buffer[i+__xlx_offset_param_training_targets];
  }
  for (int i = 0; i < __xlx_size_param_training_targets; ++i) {
    ((long long*)__xlx_apatb_param_training_targets)[i] = __xlx_training_targets_output_buffer[i].to_uint64();
  }
}
