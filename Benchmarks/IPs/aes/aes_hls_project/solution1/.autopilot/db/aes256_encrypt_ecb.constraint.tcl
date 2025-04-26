set clock_constraint { \
    name clk \
    module aes256_encrypt_ecb \
    port ap_clk \
    period 10 \
    uncertainty 1 \
}

set all_path {}

set false_path {}

