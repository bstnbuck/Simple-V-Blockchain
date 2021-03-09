import crypto.sha512
import time

struct Block {
pub mut:
	index            i64
	timestamp        string
	hash_pow         string
	text_nonce_pow   string
	prev_hash_header string
	block_hash       string
	payload          string
}

fn make_block(nulls string, mut blockchain []Block) (string, Block, u64) {
	text := get_random_string()
	mut count := u64(0)
	mut block := Block{}
	block.hash_pow, block.text_nonce_pow, count = pow(text, nulls)
	block.index = i64(blockchain.len)
	block.timestamp = time.now().str()
	block.prev_hash_header = make_last_block_hash_header(blockchain[blockchain.len - 1])
	/*
	mut payload := ''
	mut i := 1
	for i <= 10 {
		payload += ' ' + get_random_string()
		if i == 5 {
			payload += '\n'
		}
		i++
	}
	*/
	block.payload = get_transactions()
	block.block_hash = make_block_hash(block)
	output := 'New Block Index:$block.index Timestamp:$block.timestamp \nHashPoW:$block.hash_pow \nText&Nonce:$block.text_nonce_pow \nPrevHashHeader:$block.prev_hash_header \nBlockHash:$block.block_hash \nData:\n$block.payload'
	return output, block, count
}

fn make_block_hash(block Block) string {
	return sha512.hexhash(block.index.str() + block.timestamp.str() + block.hash_pow +
		block.text_nonce_pow + block.prev_hash_header + block.payload)
}

fn make_last_block_hash_header(block Block) string {
	return /*
	block.index.str() + block.timestamp.str() + block.hash_pow +
		block.text_nonce_pow + block.prev_hash_header +
	*/
	sha512.hexhash(block.block_hash)
}

fn is_new_block_valid(new_block Block, blockchain []Block) bool {
	last_block := blockchain[blockchain.len - 1]
	if make_last_block_hash_header(last_block) == new_block.prev_hash_header
		&& last_block.index + 1 == new_block.index
		&& new_block.block_hash == make_block_hash(new_block) {
		return true
	}
	return false
}

fn make_genesis_block() Block {
	text := 'Welcome to the first V-Blockchain!'
	mut block := Block{
		hash_pow: '0'
		text_nonce_pow: '0'
		index: 0
		timestamp: time.now().str()
		prev_hash_header: '0'
		payload: text
	}
	block.block_hash = make_block_hash(block)
	return block
}
