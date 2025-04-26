<project xmlns="com.autoesl.autopilot.project" name="CRS_HLS" top="spmv">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim"/>
    </Simulation>
    <files xmlns="">
        <file name="../../../CCode_crs/harness.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCode_crs/support.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCode_crs/support.h" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../CCode_crs/check.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCode_crs/input.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCode_crs/spmv.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="crs_HLS" status="active"/>
    </solutions>
</project>

