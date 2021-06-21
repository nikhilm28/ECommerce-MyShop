function add_to_cart(pid, pname, price)
{
    let cart = localStorage.getItem("cart");
    if (cart==null)
    {
        let products = new Array();
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
        console.log("Product added for first time")
    }
    else
    {
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid)
        console.log(oldProduct)
        if(oldProduct)
        {
            oldProduct.productQuantity = oldProduct.productQuantity + 1
            pcart.map((item) => {
                if(item.productId === oldProduct.productId)
                {
                    item.productQuantity = oldProduct.productQuantity;
                }
            })
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product Quantity Increased")
        }
        else
        {
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price}
            pcart.push(product)
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("Product is added")
        }
    }
    updateCart();
}  

function updateCart()
{
    let cartString=localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart == null || cart.length == 0)
    {
        console.log("Cart is Empty..");
        $(".cart-items").html("( 0 )");
        $(".cart-body").html("<h3>Cart is Empty</h3>");
        $(".chekout-btn").addClass('disabled'); 
    }
    else
    {
        console.log(cart)
        $(".cart-items").html(`(${cart.length})`);
        let table = `
            <table class='table' border=1>
            <thead class='thread-light'>
                <tr>
                <th>Item Name </th>
                <th>Price </th>
                <th>Quantity </th>
                <th>Total Price </th>
                <th>Action</th>
                </tr>        
            </thead>
                `;
        
        let totalPrice = 0;
        cart.map((item) => {
            table += `
                    <tr>
                        <td> ${item.productName} </td>
                        <td> ${item.productPrice} </td>
                        <td> ${item.productQuantity} </td>
                        <td> ${item.productQuantity * item.productPrice} </td>
                        <td> <button onclick='deleteItemFromCart(${item.productId})' style="background-color: red">Remove</button> </td>    
                     </tr>
                    `
            totalPrice += item.productPrice * item.productQuantity;
            })
            
            table = table + `
                <tr><td colspan='5' style="text-align: right"><b> Total Price : ${totalPrice} <b></td></tr>
            </table>`
            $(".cart-body").html(table);
            $(".chekout-btn").removeClass('disabled');

    }
        
    
}

function deleteItemFromCart(pid)
{
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId != pid)
    localStorage.setItem('cart',JSON.stringify(newcart))
    updateCart();
}

$(document).ready(function () {

    updateCart()
})


