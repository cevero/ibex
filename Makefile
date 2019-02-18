PROJECT = $(shell basename *.qpf .qpf)

default: compile

all: compile fpga

as:
	quartus_map --read_settings_files=on --write_settings_files=off $(PROJECT) -c $(PROJECT)

compile:
	quartus_map --read_settings_files=on --write_settings_files=off $(PROJECT) -c $(PROJECT)
	quartus_fit --read_settings_files=off --write_settings_files=off $(PROJECT) -c $(PROJECT)
	quartus_asm --read_settings_files=off --write_settings_files=off $(PROJECT) -c $(PROJECT)
	quartus_sta $(PROJECT) -c $(PROJECT)
	quartus_eda --read_settings_files=off --write_settings_files=off $(PROJECT) -c $(PROJECT)

fpga:
	quartus_pgm -m JTAG -o 'p;'./output_files/$(PROJECT).sof''
