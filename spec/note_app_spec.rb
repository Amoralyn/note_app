require_relative '../lib/note_app'
require 'spec_helper'

RSpec.describe Note::NotesApplication do 
	subject(:notes) { Note::NotesApplication }
	subject(:note_obj) { notes.new('Lovelyn') }

	describe '#initialize' do
	  it 'returns an Instance of NotesApplication' do
		expect(notes.new('Lovelyn')).to be_an_instance_of notes
	  end

	  it 'accepts only one argument' do
	  	expect { notes.new }.to raise_error ArgumentError	  	
	  	expect { notes.new('Lovelyn', 'Bose') }.to raise_error ArgumentError
	  	expect { notes.new('Lovelyn') }.not_to raise_error	
	  end
	end

	describe '#create' do
	  it 'accepts only one argument' do
	  	expect{note_obj.create('Lovelyn')}.not_to raise_error
	  	expect{note_obj.create('Lovelyn', 'Bose')}.to raise_error ArgumentError
	  	expect{note_obj.create}.to raise_error ArgumentError
	  end

	  it 'adds note content to the note list ' do
	  	note_obj.create("This is a unit test")
	  	expect(note_obj.instance_variable_get('@notes')).to eql ['This is a unit test']
	  	expect(note_obj.instance_variable_get('@notes').length).to eql 1
		expect { note_obj.create('This is a unit test') }.to output("Note has been created!\n\n").to_stdout

	  	
	  end
	end

	describe '#list' do
	  it 'does not take any argument' do
	    expect { note_obj.list('Say yes')}.to raise_error ArgumentError
	  		
	  end
  
	  it 'lists out available notes ' do
	    note_obj.create('This is a unit test')
	    result = "NOTE ID : 1\n\nThis is a unit test\n\nBy Author: Lovelyn\n\n===============================\n\n"
	    expect { note_obj.list }.to output(result).to_stdout
	  end	 
  
	  it 'gives a notice when the list is empty' do
	   	result = "No notes available\n\n"
	    expect { note_obj.list }.to output(result).to_stdout
	  end 
	end

	describe '#get' do
		it 'displays a note with a given ID' do
	    	note_obj.create('This is a unit test')
	    	note_obj.create('This is not a unit test')
			expect {note_obj.get(2)}.to output("This is not a unit test\n").to_stdout
		end

		it 'takes in one argument' do
			expect{note_obj.get(1)}.not_to raise_error
			expect{note_obj.get(1, 2)}.to raise_error ArgumentError
			expect{note_obj.get}.to raise_error ArgumentError			
		end
	  		
	  	it 'gives a notice when the ID is invalid' do
	  		result = "Invalid ID: 1\n\n"
	    	expect { note_obj.get(1) }.to output(result).to_stdout	  		
	  	end
	end

	describe '#search' do
	  it 'takes in one argument' do
	  	expect {note_obj.search('is')}.not_to raise_error
	  	expect {note_obj.search('is', 'a')}.to raise_error ArgumentError
	  	expect {note_obj.search}.to raise_error ArgumentError
	  end

	  it 'searches the saved notes and displays note that contain the search key' do
	  	note_obj.create('This is a unit test')
	  	note_obj.create('This is not a unit test')
	  	result = "Showing results for search 'not':\n\nNOTE ID : 2\n\nThis is not a unit test\n\nBy Author: Lovelyn\n\n===============================\n\n"
	    expect { note_obj.search('not') }.to output(result).to_stdout
	  end

	  it 'searches the saved notes and displays note that contain the search key' do
	  	note_obj.create('This is a unit test')
	  	note_obj.create('This is a good unit test')
	  	result = "Showing results for search 'not':\n\nNo result found\n\n"
	    expect { note_obj.search('not') }.to output(result).to_stdout
	  end	  

	  it 'gives a notice when search key is not found' do
	  	result = "No notes to search through\n"
	    expect { note_obj.search('not') }.to output(result).to_stdout  	
	  end

	end

	describe '#delete' do
	  it 'deletes note with given NOTE ID' do
		note_obj.create('This is a unit test')
		note_obj.create('This is not a unit test')
		expect {note_obj.delete(2)}.to output("Note with ID 2 has been deleted\n\n").to_stdout
	  end

	  it 'gives a notice when NOTE ID is not found' do
	  	result =  "Invalid ID: 2\n\n"
		note_obj.create('This is a unit test')
		expect {note_obj.delete(2)}.to output(result).to_stdout
	  end

	  it 'takes in one argument' do
	  	  expect {note_obj.delete(1)}.not_to raise_error
	  	  expect {note_obj.delete(1,2)}.to raise_error ArgumentError
	  	  expect {note_obj.delete}.to raise_error ArgumentError  	
	  end
	end

	describe '#edit' do
	  it 'changes a previous note content to a new note content' do
	  	note_obj.create('This is a unit test')
		note_obj.create('This is not a unit test')
		expect {note_obj.edit(2,"It's all about the bass!")}.to output("Your note with NOTE ID : 2, has been changed to It's all about the bass!\n").to_stdout
	  end

	  it 'takes in two argument' do
	  	expect {note_obj.edit(1)}.to raise_error ArgumentError
	  	expect {note_obj.edit(1,"I Love You")}.not_to raise_error 
	  	expect {note_obj.edit}.to raise_error ArgumentError	  	
	  end

	   it 'gives a notice when NOTE ID is not found' do
	  	result =  "Invalid ID: 2\n"
		note_obj.create('This is a unit test')
		expect {note_obj.edit(2, "If I were a boy")}.to output(result).to_stdout
	  end
	end


end