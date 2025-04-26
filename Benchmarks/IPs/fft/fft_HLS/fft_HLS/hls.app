<project xmlns="com.autoesl.autopilot.project" top="fft" name="fft_HLS">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim"/>
    </Simulation>
    <files xmlns="">
        <file name="../../../CCode_fft/support.h" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCode_fft/support.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCode_fft/harness.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../CCode_fft/input.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCode_fft/fft.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCode_fft/check.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="fft_HLS" status="active"/>
    </solutions>
</project>

