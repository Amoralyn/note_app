require_relative '../lib/note_app'
require 'spec_helper'

RSpec.describe Note::NotesApplication do 
	describe '#initialize' do
	  it 'returns an Instance of NotesApplication' do
		expect(Note::NotesApplication.new('Lovelyn')).to be_an_instance_of Note::NotesApplication
	  end

	  it 'accepts only one argument' do
	  	expect { Note::NotesApplication.new }.to raise_error ArgumentError	  	
	  end
	end

	describe '#create' do
	  
	end
end