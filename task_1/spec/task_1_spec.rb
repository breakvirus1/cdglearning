require_relative '../task_1'
  describe Task_1_class_for_tests do
    # describe '#word_check' do
    # puts("Тесты:")
      it 'prints a result with the word "jhdcs"' do
        newword1 = Task_1_class_for_tests.new
        expect(newword1.word_check('jhdcs ertert 5y4')).to eq(32)
      end

      it 'prints a result with the word "jhd"' do
        newword1 = Task_1_class_for_tests.new
        expect(newword1.word_check('jhd')).to eq('dhj')
      end
      
      it 'prints a result with the reverse word' do
        newword1 = Task_1_class_for_tests.new
        expect(newword1.word_check('try')).to eq('yrt')
      end

      it 'prints a result with the "" return nil' do
        newword1 = Task_1_class_for_tests.new
        expect(newword1.word_check('')).to eq(nil)
      end

  end

