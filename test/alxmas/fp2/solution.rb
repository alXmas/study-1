module Alxmas
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in self do
          yield(i)
        end
      end

      # Написать свою функцию my_map
      def my_map
        result = MyArray.new
        for i in self do
          result << yield(i)
        end
        result
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new
        for i in self do
          result << i unless i.nil?
        end
        result
        end

      def my_reduce(acc = nil)
        my_each do |elem|
          if acc.nil?
            acc = self[0]
            next
          end
            acc = yield(acc,elem)
        end
        acc
      end
    end
  end
end

