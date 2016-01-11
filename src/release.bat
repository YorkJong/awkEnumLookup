call build.bat enum
if not exist enum_lookup (
    md enum_lookup
)
copy *.h enum_lookup
copy enum.bat enum_lookup
copy enum.exe enum_lookup
