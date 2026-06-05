<?xml version="1.0" encoding="UTF-8"?>

<language_definitions>
    <language processor="M32R"
              endian="big"
              size="32"
              variant="default"
              version="1.0"
              slafile="m32r.sla"
              processorspec="m32r.pspec"
              id="m32r:2:default">
        <description>M32R big-endian default FP=0x80C000</description>
        <compiler name="default" spec="m32r.cspec" id="default"/>
    </language>
	<language processor="M32R"
              endian="big"
              size="32"
              variant="fp8000"
              version="1.0"
              slafile="m32r-fp8000.sla"
              processorspec="m32r.pspec"
              id="m32r:2:fp8000">
        <description>M32R big-endian FP=0x808000</description>
        <compiler name="default" spec="m32r.cspec" id="default"/>
    </language>

	<language processor="M32R"
              endian="big"
              size="32"
              variant="mitsubishi-fp8000"
              version="1.2"
              slafile="m32r-fp8000.sla"
              processorspec="m32r-mitsubishi.pspec"
              id="m32r:2:mitsubishi-fp8000">
        <description>M32R Mitsubishi/Renesas M32R-ECU FP=0x808000, corrected M32186F8 RAM/SFR/flash map</description>
        <compiler name="default" spec="m32r.cspec" id="default"/>
    </language>
</language_definitions>