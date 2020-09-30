meta:
  id: dto
  title: DTB/DTBO
  license: CC0-1.0
  file-extension: img
  endian: be
types:
  header:
    seq:
    - id: magic
      contents: [ 0xd7, 0xb7, 0xab, 0x1e ]
    - id: total_size
      type: u4
    - id: header_size
      type: u4
    - id: dt_entry_size
      type: u4
    - id: dt_entry_count
      type: u4
    - id: dt_entries_offset
      type: u4
    - id: page_size
      type: u4
    - id: version
      type: u4
  entry:
    seq:
    - id: size
      type: u4
    - id: offset
      type: u4
    - id: id
      type: u4
    - id: rev
      type: u4
    - id: custom
      type: u4
      repeat: expr
      repeat-expr: 4
    instances:
      body:
        io: _root._io
        pos: offset
        size: size
seq:
  - id: header
    type: header
  - id: entries
    type: entry
    repeat: expr
    repeat-expr: header.dt_entry_count
