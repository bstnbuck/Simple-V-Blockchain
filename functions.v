import os
import crypto.rand
import encoding.base64

fn calculate_hashrate(duration u64, count u64) string {
	return (count / duration).str()
}

fn write_to_blockchain_file(filename string, output string) {
	mut file := os.open_append(filename) or {
		println(err)
		return
	}
	file.write_string(output) or {
		println(err)
		return
	}
	file.close()
}

fn make_string_nulls(nulls int) string {
	mut strnulls := ''
	for i := 0; i < nulls; i++ {
		strnulls += '0'
	}
	return strnulls
}

fn get_random_bytes(n int) ![]u8 {
	random_bytes := rand.read(n) or { return err }
	return random_bytes
}

fn get_random_string() string {
	bytes := get_random_bytes(2) or {
		println(err)
		return ''
	}
	random_string := base64.encode(bytes)
	return random_string
}

// adds last 10 generated transaction with lifo-principle (last in -> first out) to the payload of new generated block
fn get_transactions() string {
	filename := 'addTransaction/payload.gop'
	transfers := os.read_file(filename) or {
		println(err)
		return ''
	}
	mut output := ''
	lines := transfers.split_into_lines()
	mut counter := 15
	mut text := []string{}

	// scan first 10 transactions (27 lines) into output string, all others that follow save to another variable
	if lines.len < counter {
		counter = lines.len
	}
	mut progress := 0
	for progress < counter {
		output += lines[progress] + '\n'
		progress++
	}
	text = lines[counter..lines.len].clone()

	// create file new (clear it) and move all others that follow after the 10 transactions into it
	os.create(filename) or {
		println(err)
		return ''
	}
	mut file := os.open_append(filename) or {
		println(err)
		return ''
	}
	for i in 0 .. text.len {
		file.write_string(text[i] + '\n') or {
			println(err)
			return ''
		}
	}
	file.close()
	return output
}
