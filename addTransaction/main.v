/*
AddTransaction
	*generates automatically ... new random transactions
	*generates manually ... new transactions
	*saves transaction in payload.gop file
*/
import os
import time
import rand
import encoding.base64
import strconv
import crypto.rand as crand

fn main() {
	filename := 'payload.gop'
	os.create(filename) or {
		println(err)
		return
	}
	mut stop := false
	for stop == false {
		mode := strconv.atoi(os.input('Starting... Generate transactions automatically? [1] = automatically, [99] = Stop\n'))
		if mode == 1 {
			mut times := strconv.atoi(os.input('[AUTO] How many Transactions should be generated? \n'))
			run_auto(times, filename)
			again := strconv.atoi(os.input('[AUTO] Finished! Any more? [1] = yes [2] = no\n'))
			if again == 1 {
				continue
			}
			stop = true
		} else if mode == 99 {
			println('Stopping... ')
			stop = true
		} else {
			println('Wrong entry, mistyped?')
			continue
		}
		_ := os.input('Press ENTER to continue... ')
	}
}

// generates automatically new transactions
fn run_auto(times int, filename string) {
	mut file := os.open_append(filename) or {
		println(err)
		return
	}
	// generate random transactions
	transactions := generate_transactions(times)
	// append them to the file
	add_transaction(mut file, transactions)
	file.close()
}

fn generate_transactions(times int) []string {
	mut output := []string{}
	mut i := 0
	for i < times {
		time_now := time.now().str()
		from := get_random_string()
		to := get_random_string()
		transfer := get_random_float()
		output <<
			'New Transaction Timestamp:$time_now\n From:$from To:$to\n Transfer:$transfer\n'
		i++
	}
	return output
}

// adds transactions to file
fn add_transaction(mut file os.File, transaction []string) {
	for output in transaction {
		file.write(output)
	}
}

// generates some random bytes for random string
fn get_random_bytes(n int) ?[]byte {
	random_bytes := crand.read(n) or {
		return error(err)
	}
	return random_bytes
}

// generates some random string
fn get_random_string() string {
	bytes := get_random_bytes(2) or {
		println(err)
		return ''
	}
	random_string := base64.encode(bytes.str())
	return random_string
}

// generates some random floats
fn get_random_float() f32 {
	random := rand.f32n(100)
	return random
}
