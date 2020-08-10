import time
import os

fn run(times int, nulls string, mut blockchain []Block) {
	filename := 'examples/blckchn.txt'
	mut file := os.create(filename) or {
		println(err)
		return
	}
	file.close()
	mut i := 0
	for i != times {
		timestamp_start := time.now()
		println('Started: ' + timestamp_start.str())
		output, new_block, count := make_block(nulls, mut blockchain)
		timestamp_stop := time.now()
		is_valid := is_new_block_valid(new_block, blockchain)
		if is_valid {
			blockchain << new_block
			write_to_blockchain_file(filename, output)
			println('\n' + output + '\n>> Block is valid! <<\n')
			duration := timestamp_stop.unix_time_milli() - timestamp_start.unix_time_milli()
			print('Stopped: ' + timestamp_stop.str())
			output_duration := '\nTime to make new Block: ' + duration.str() + 'ms => ' + (duration /
				1000).str() + 'sec'
			println(output_duration)
			write_to_blockchain_file(filename, output_duration)
			print('Count: ' + count.str())
			hashrate := '\nHashrate: ' + calculate_hashrate(duration, count) + ' H/ms (Hashes per millisecond)\n\n'
			println(hashrate)
			write_to_blockchain_file(filename, hashrate)
			i++
		} else {
			println("Last Block isn't valid, so it will not append to the Blockchain!")
		}
	}
}
