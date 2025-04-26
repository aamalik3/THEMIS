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
extern "C" void needwun(char*, char*, char*, char*, int*, char*);
extern "C" void apatb_needwun_hw(volatile void * __xlx_apatb_param_SEQA, volatile void * __xlx_apatb_param_SEQB, volatile void * __xlx_apatb_param_alignedA, volatile void * __xlx_apatb_param_alignedB, volatile void * __xlx_apatb_param_M, volatile void * __xlx_apatb_param_ptr) {
  // Collect __xlx_SEQA__tmp_vec
  vector<sc_bv<8> >__xlx_SEQA__tmp_vec;
  for (int j = 0, e = 128; j != e; ++j) {
    __xlx_SEQA__tmp_vec.push_back(((char*)__xlx_apatb_param_SEQA)[j]);
  }
  int __xlx_size_param_SEQA = 128;
  int __xlx_offset_param_SEQA = 0;
  int __xlx_offset_byte_param_SEQA = 0*1;
  char* __xlx_SEQA__input_buffer= new char[__xlx_SEQA__tmp_vec.size()];
  for (int i = 0; i < __xlx_SEQA__tmp_vec.size(); ++i) {
    __xlx_SEQA__input_buffer[i] = __xlx_SEQA__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_SEQB__tmp_vec
  vector<sc_bv<8> >__xlx_SEQB__tmp_vec;
  for (int j = 0, e = 128; j != e; ++j) {
    __xlx_SEQB__tmp_vec.push_back(((char*)__xlx_apatb_param_SEQB)[j]);
  }
  int __xlx_size_param_SEQB = 128;
  int __xlx_offset_param_SEQB = 0;
  int __xlx_offset_byte_param_SEQB = 0*1;
  char* __xlx_SEQB__input_buffer= new char[__xlx_SEQB__tmp_vec.size()];
  for (int i = 0; i < __xlx_SEQB__tmp_vec.size(); ++i) {
    __xlx_SEQB__input_buffer[i] = __xlx_SEQB__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_alignedA__tmp_vec
  vector<sc_bv<8> >__xlx_alignedA__tmp_vec;
  for (int j = 0, e = 256; j != e; ++j) {
    __xlx_alignedA__tmp_vec.push_back(((char*)__xlx_apatb_param_alignedA)[j]);
  }
  int __xlx_size_param_alignedA = 256;
  int __xlx_offset_param_alignedA = 0;
  int __xlx_offset_byte_param_alignedA = 0*1;
  char* __xlx_alignedA__input_buffer= new char[__xlx_alignedA__tmp_vec.size()];
  for (int i = 0; i < __xlx_alignedA__tmp_vec.size(); ++i) {
    __xlx_alignedA__input_buffer[i] = __xlx_alignedA__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_alignedB__tmp_vec
  vector<sc_bv<8> >__xlx_alignedB__tmp_vec;
  for (int j = 0, e = 256; j != e; ++j) {
    __xlx_alignedB__tmp_vec.push_back(((char*)__xlx_apatb_param_alignedB)[j]);
  }
  int __xlx_size_param_alignedB = 256;
  int __xlx_offset_param_alignedB = 0;
  int __xlx_offset_byte_param_alignedB = 0*1;
  char* __xlx_alignedB__input_buffer= new char[__xlx_alignedB__tmp_vec.size()];
  for (int i = 0; i < __xlx_alignedB__tmp_vec.size(); ++i) {
    __xlx_alignedB__input_buffer[i] = __xlx_alignedB__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_M__tmp_vec
  vector<sc_bv<32> >__xlx_M__tmp_vec;
  for (int j = 0, e = 16641; j != e; ++j) {
    __xlx_M__tmp_vec.push_back(((int*)__xlx_apatb_param_M)[j]);
  }
  int __xlx_size_param_M = 16641;
  int __xlx_offset_param_M = 0;
  int __xlx_offset_byte_param_M = 0*4;
  int* __xlx_M__input_buffer= new int[__xlx_M__tmp_vec.size()];
  for (int i = 0; i < __xlx_M__tmp_vec.size(); ++i) {
    __xlx_M__input_buffer[i] = __xlx_M__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_ptr__tmp_vec
  vector<sc_bv<8> >__xlx_ptr__tmp_vec;
  for (int j = 0, e = 16641; j != e; ++j) {
    __xlx_ptr__tmp_vec.push_back(((char*)__xlx_apatb_param_ptr)[j]);
  }
  int __xlx_size_param_ptr = 16641;
  int __xlx_offset_param_ptr = 0;
  int __xlx_offset_byte_param_ptr = 0*1;
  char* __xlx_ptr__input_buffer= new char[__xlx_ptr__tmp_vec.size()];
  for (int i = 0; i < __xlx_ptr__tmp_vec.size(); ++i) {
    __xlx_ptr__input_buffer[i] = __xlx_ptr__tmp_vec[i].range(7, 0).to_uint64();
  }
  // DUT call
  needwun(__xlx_SEQA__input_buffer, __xlx_SEQB__input_buffer, __xlx_alignedA__input_buffer, __xlx_alignedB__input_buffer, __xlx_M__input_buffer, __xlx_ptr__input_buffer);
// print __xlx_apatb_param_SEQA
  sc_bv<8>*__xlx_SEQA_output_buffer = new sc_bv<8>[__xlx_size_param_SEQA];
  for (int i = 0; i < __xlx_size_param_SEQA; ++i) {
    __xlx_SEQA_output_buffer[i] = __xlx_SEQA__input_buffer[i+__xlx_offset_param_SEQA];
  }
  for (int i = 0; i < __xlx_size_param_SEQA; ++i) {
    ((char*)__xlx_apatb_param_SEQA)[i] = __xlx_SEQA_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_SEQB
  sc_bv<8>*__xlx_SEQB_output_buffer = new sc_bv<8>[__xlx_size_param_SEQB];
  for (int i = 0; i < __xlx_size_param_SEQB; ++i) {
    __xlx_SEQB_output_buffer[i] = __xlx_SEQB__input_buffer[i+__xlx_offset_param_SEQB];
  }
  for (int i = 0; i < __xlx_size_param_SEQB; ++i) {
    ((char*)__xlx_apatb_param_SEQB)[i] = __xlx_SEQB_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_alignedA
  sc_bv<8>*__xlx_alignedA_output_buffer = new sc_bv<8>[__xlx_size_param_alignedA];
  for (int i = 0; i < __xlx_size_param_alignedA; ++i) {
    __xlx_alignedA_output_buffer[i] = __xlx_alignedA__input_buffer[i+__xlx_offset_param_alignedA];
  }
  for (int i = 0; i < __xlx_size_param_alignedA; ++i) {
    ((char*)__xlx_apatb_param_alignedA)[i] = __xlx_alignedA_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_alignedB
  sc_bv<8>*__xlx_alignedB_output_buffer = new sc_bv<8>[__xlx_size_param_alignedB];
  for (int i = 0; i < __xlx_size_param_alignedB; ++i) {
    __xlx_alignedB_output_buffer[i] = __xlx_alignedB__input_buffer[i+__xlx_offset_param_alignedB];
  }
  for (int i = 0; i < __xlx_size_param_alignedB; ++i) {
    ((char*)__xlx_apatb_param_alignedB)[i] = __xlx_alignedB_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_M
  sc_bv<32>*__xlx_M_output_buffer = new sc_bv<32>[__xlx_size_param_M];
  for (int i = 0; i < __xlx_size_param_M; ++i) {
    __xlx_M_output_buffer[i] = __xlx_M__input_buffer[i+__xlx_offset_param_M];
  }
  for (int i = 0; i < __xlx_size_param_M; ++i) {
    ((int*)__xlx_apatb_param_M)[i] = __xlx_M_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_ptr
  sc_bv<8>*__xlx_ptr_output_buffer = new sc_bv<8>[__xlx_size_param_ptr];
  for (int i = 0; i < __xlx_size_param_ptr; ++i) {
    __xlx_ptr_output_buffer[i] = __xlx_ptr__input_buffer[i+__xlx_offset_param_ptr];
  }
  for (int i = 0; i < __xlx_size_param_ptr; ++i) {
    ((char*)__xlx_apatb_param_ptr)[i] = __xlx_ptr_output_buffer[i].to_uint64();
  }
}
