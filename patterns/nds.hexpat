// #pragma author mirusu400
// #pragma description Nintendo DS cartridge ROM

// #include <std/io.pat>
// #include <type/base.pat>
// #include <std/core.pat>

// #include <type/magic.pat>
// #include <type/size.pat>

// NDS Region
enum NDSRegion : u8 {
    normal = 0,
    korea = 0x40,
    china = 0x80,
};

struct NDS_header {
    char GameTitle[12];
    u32 GameCode;
    u16 MakerCode;
    u8 UnitCode;
    u8 EncryptionSeedSelect;
    u8 DeviceCapacity;
    u8 Reserved1[8];
    NDSRegion Region;
    u8 ROMVersion;
    u8 AutoStart;

    u32 ARM9ROMOffset;
    u32 ARM9EntryAddress;
    u32 ARM9RAMAddress;
    u32 ARM9Size;

    u32 ARM7ROMOffset;
    u32 ARM7EntryAddress;
    u32 ARM7RAMAddress;
    u32 ARM7Size;

    u32 FNTOffset;
    u32 FNTSize;

    u32 FATOffset;
    u32 FATSize;

    u32 ARM9OverlayOffset;
    u32 ARM9OverlaySize;
    u32 ARM7OverlayOffset;
    u32 ARM7OverlaySize;

    u32 NormalCardControlRegisterSettings;
    u32 SecureCardControlRegisterSettings;

    u32 IconTitleOffset;
    u16 SecureAreaCRC;
    u16 RomTimeout;
    u32 ARM9Autoload;
    u32 ARM7Autoload;

    u8 infoResevedRegion[8];

    u32 EndRomOffset;
    u32 HeaderSize;
    u32 ARM9Module;
    u32 ARM7Module;

    u8 Reserved2[48];

    u8 NintendoLogo[156];
    u16 NintendoLogoCRC;

    u16 LogoCRC16;
    u16 HeaderCRC16;

    u8 DebuggerReserved[32];
};


// File Allocation Table (FAT)
// typedef struct {
//     DWORD start                 <format=hex, comment="Start address (originated at IMG base) (0=Unused Entry)">;
//     DWORD end                   <format=hex, comment="End address   (Start+Len...-1?)        (0=Unused Entry)">;
// } FAT_NITRO;

// // FNT Directory Main-Table
// typedef struct {
//     DWORD offset                <format=hex, comment="Offset to Sub-table             (originated at FNT base)">;
//     USHORT firstID              <format=hex, comment="ID of first file in Sub-table   (0000h..EFFFh)">;
//     USHORT parentID             <format=hex, comment="First entry: Total Number of directories (1..4096) / Further entries: ID of parent directory (F000h..FFFEh)">;
// } FNT_MAIN;

// // FNT Sub-table Entry
// typedef struct {
//     union {
//         UCHAR value;
//         struct {
//             UBYTE length : 7        <comment="Filename Length">;
//             BYTE isDirectory : 1    <comment="0: File Entry, 1: Sub-Directory Entry">;
//         } fields;
//     } attributes                    <comment="Type/Length">;

//     if (attributes.value != 0) {
//         UCHAR filename[attributes.fields.length] <comment="File or Sub-Directory Name, case-sensitive, without any ending zero">;
//         if (attributes.fields.isDirectory) {
//             USHORT directoryID      <format=hex, comment="Sub-Directory ID (F001h..FFFFh) ;see FNT+(ID AND FFFh)*8">;
//         }
//     }
// } FNT_ENTRY;

// // FNT Sub-tables
// typedef struct {
//     do {
//         FNT_ENTRY entry;
//     } while (entry.attributes.value != 0);
// } FNT_SUB;

// // File Name Table (FNT)
// typedef struct {
//     local quad FNTstart = FTell();

//     local USHORT numOfDirectories = ReadUShort(FNTstart + 6);
//     FNT_MAIN directories[numOfDirectories];

//     local int iDirectory;
//     for (iDirectory = 0; iDirectory < numOfDirectories; iDirectory++) {
//         FNT_SUB entries;
//     }
// } FNT_NITRO;

// // ARM9 and ARM7 Overlay Tables (OVT)
// typedef struct {
//     DWORD id                    <format=hex, comment="Overlay ID">;
//     DWORD RAMaddr               <format=hex, comment="RAM Address ;Point at which to load">;
//     DWORD RAMSize               <format=hex, comment="RAM Size    ;Amount to load">;
//     DWORD BSSSize               <format=hex, comment="BSS Size    ;Size of BSS data region">;
//     DWORD start                 <format=hex, comment="Static initialiser start address">;
//     DWORD end                   <format=hex, comment="Static initialiser end address">;
//     DWORD fileID                <format=hex, comment="File ID  (0000h..EFFFh)">;
//     DWORD reserved              <comment="Reserved (zero)">;
// } OVR_NITRO;

NDS_header ndsheader @ 0x00;