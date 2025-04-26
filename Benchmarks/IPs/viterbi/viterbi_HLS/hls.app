<project xmlns="com.autoesl.autopilot.project" top="viterbi" name="viterbi_HLS">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim"/>
    </Simulation>
    <files xmlns="">
        <file name="../../CCode/harness.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="CCode/viterbi.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="CCode/input.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="CCode/check.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="viterbi_hls" status="active"/>
    </solutions>
</project>

