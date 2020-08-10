import os
import crypto.rand
import encoding.base64

fn calculate_hashrate(duration, count u64) string {
	return (count / duration).str()
}

fn write_to_blockchain_file(filename, output string) {
	mut file := os.open_append(filename) or {
		println(err)
		return
	}
	file.write(output)
	file.close()
}

fn make_string_nulls(nulls int) string {
	mut strnulls := ''
	for i := 0; i < nulls; i++ {
		strnulls += '0'
	}
	return strnulls
}

fn get_random_bytes(n int) ?[]byte {
	random_bytes := rand.read(n) or {
		return error(err)
	}
	return random_bytes
}

fn get_random_string() string {
	bytes := get_random_bytes(2) or {
		println(err)
		return ''
	}
	random_string := base64.encode(bytes.str())
	return random_string
}
