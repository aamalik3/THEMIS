<project xmlns="com.autoesl.autopilot.project" top="bbgemm" name="Blocked_HLS">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim"/>
    </Simulation>
    <files xmlns="">
        <file name="../../../CCODE_Blocked/support.h" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCODE_Blocked/support.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCODE_Blocked/harness.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../CCODE_Blocked/input.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCODE_Blocked/gemm.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCODE_Blocked/check.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="Blocked_HLS" status="active"/>
    </solutions>
</project>

