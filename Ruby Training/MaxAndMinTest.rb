arr=Array[56,85,45,25,36,75,95,15,35,65]

puts n=arr.length
for i in 0...n-1
	for j in 0...n-1-i

		if arr[j]>arr[j+1]

			arr[j],arr[j+1]=arr[j+1],arr[j]

			swapped =true
			
		end
	end
end
puts arr[0]
puts arr[n-1]