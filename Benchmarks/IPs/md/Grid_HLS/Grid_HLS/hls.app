<project xmlns="com.autoesl.autopilot.project" top="md" name="Grid_HLS">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim"/>
    </Simulation>
    <files xmlns="">
        <file name="../../../CCode_grid/support.h" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCode_grid/support.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCode_grid/harness.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../CCode_grid/md.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCode_grid/input.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCode_grid/check.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="Grid_HLS" status="active"/>
    </solutions>
</project>

