import crypto.sha512
import rand

fn pow(text, nulls string) (string, string, u64) {
	mut nonce := rand.u64()
	mut count := u64(0)
	mut hashthex := ''
	for { // endless while
		hashthex = sha512.hexhash(text + nonce.str())
		if hashthex.starts_with(nulls) {
			return hashthex, text + nonce.str(), count
		}
		// println(hashthex)		// DEBUG
		hashthex.free()
		nonce++ // increment nonce and counter by 1
		count++
	}
	return '', '', 0
}
