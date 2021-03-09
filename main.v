import os
import strconv

fn main() {
	println('Welcome to the first Blockchain written in Vlang!')
	genesis_block := make_genesis_block()
	mut blockchain := []Block{}
	blockchain << genesis_block
	nulls_in := strconv.atoi(os.input('Starting... How much leading hex nulls? ')) ?
	nulls := make_string_nulls(nulls_in)
	times := strconv.atoi(os.input('How many blocks should be generated? ')) ?
	run(times, nulls, mut blockchain)
	_ := os.input('All Blocks generated! Press ENTER to continue... ')
}
