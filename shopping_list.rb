require 'colorize'
require 'pry'

@shopping_items = [ 
  {item: "eggs", price: 1.59 }, 
  {item: "milk", price: 2.99 }, 
  {item: "juice", price: 1.99 }, 
  {item: "fruit", price: 0.99 }, 
  {item: "cheese", price: 4.99 },
  ]

@shopping_cart = []

def all_items
  if @shopping_items.any? 
    @shopping_items.each_with_index do | item, i| 
      puts "#{i + 1} #{item[:item]} $#{item[:price]}"
      puts "================="
    end
  else 
    puts "All items are in your cart."
    menu
  end
end 

def add_item
  puts "What would you like to add to the cart?"
  all_items 
  item_num = gets.strip
  if item_num.match(/^\d+$/)
    item_num = item_num.to_i - 1
      if @shopping_items[item_num] == nil || item_num < 0 
        puts "That's not an option"
      else 
      item_added = @shopping_items.delete_at(item_num)
      @shopping_cart << item_added  
      print item_added[:item].green
      puts " have been added".green
      wallet
    end 
  else 
    puts "That's not an option."
  end  
  menu
end 

def view_cart
  if @shopping_cart != 0 
  puts "SHOPPING CART ITEMS"
    @shopping_cart.each_with_index do | item, i| 
      puts "#{i + 1} #{item[:item]} $#{item[:price]}"
      puts "================="
    end 
  else 
    puts "Your cart is empty! Add items to your cart."
  end 
  menu
end 

def cart
  if @shopping_cart.any?
    @shopping_cart.each_with_index do | item, i | 
      puts "#{i + 1} #{item[:item]} $#{item[:price]}"
      puts "================="
    end
  else 
    puts "Your cart is empty."
  end
end 

def remove_item
  puts "What would you like to remove from your cart?"
  cart 
  item_num = gets.strip
  if item_num.match(/\d+/)
    item_num = item_num.to_i - 1
    if @shopping_cart[item_num] == nil || item_num < 0
      puts "That's not an option"
    else 
      item_removed = @shopping_cart.delete_at(item_num)
      @shopping_items << item_removed 
      print item_removed[:item].green
      puts " has been removed".green
    end 
  else 
    puts "That's not an option."
  end  
  menu
end 

def wallet 
  total = []
  @shopping_cart.each do | item | 
    total << item[:price] 
  end
  cost = total.sum.round(2)
  puts "You have spent: $#{cost}"
  menu
end

def menu
  puts "1) Add Item to Cart"
  puts "2) Remove Items from Cart"
  puts "3) View Cart"
  puts "4) Check Wallet"
  puts "5) Exit"

  option = gets.chomp.to_i
  case option
    when 1
      add_item
    when 2
      remove_item
    when 3
      view_cart
    when 4
      wallet
    when 5 
      exit
    else 
      puts "Not a valid option. Try again."
      menu
    end 
end 

menu