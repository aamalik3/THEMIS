<project xmlns="com.autoesl.autopilot.project" top="kmp" name="kmp_HLS">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim"/>
    </Simulation>
    <files xmlns="">
        <file name="../../../CCode_kmp/support.h" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCode_kmp/support.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCode_kmp/harness.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../CCode_kmp/kmp.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCode_kmp/input.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCode_kmp/check.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="kmp_HLS" status="active"/>
    </solutions>
</project>

