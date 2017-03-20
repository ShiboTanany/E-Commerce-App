package com.mobiland.model;

import com.mobiland.controller.StatusHandler;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Eslam
 */
public class DBConnection {

    private final Connection con;

    public DBConnection() throws SQLException {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());

//Hatem Alamir driver
           /*con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobiland?"
         + "user=hatem&password=Splinter_Cell#4507&autoReconnect=true&useSSL=false");*/
//Islam Ashour driver
        //    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mobiland","root","");
        //shaaban drive 
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mobiland", "root", "root");
    }

    //Added by Ashour-----------------------------
    public int insertUser(Customer customer, Part part) throws IOException {

        int result = StatusHandler.ERR_DB_PROC;

        try {
            PreparedStatement check = con.prepareStatement("select email from customer where email=(?)");
            check.setString(1, customer.getEmail());
            ResultSet rs = check.executeQuery();
            if (rs.next()) {
                result = StatusHandler.ERR_SIGNUP_EMAIL;
            } else {
                PreparedStatement insert = con.prepareStatement("insert into customer(fName,lName,email,phone,password,cash,birthdate,job,address,interest,image) values(?,?,?,?,?,?,?,?,?,?,?)");
                InputStream is = part.getInputStream();
                insert.setString(1, customer.getFName());
                insert.setString(2, customer.getLName());
                insert.setString(3, customer.getEmail());
                insert.setString(4, customer.getPhone());
                insert.setString(5, customer.getPassword());
                insert.setDouble(6, customer.getCash());
                insert.setString(7, customer.getBirthdate());
                insert.setString(8, customer.getJob());
                insert.setString(9, customer.getAddress());
                insert.setString(10, customer.getInterest());
                insert.setBinaryStream(11, is, (int) part.getSize());

                if (insert.executeUpdate() != 0) {
                    result = StatusHandler.SUCCESS;
                }
            }

        } catch (SQLException e) {
            if (e instanceof com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException) {
                result = StatusHandler.ERR_SIGNUP_EMAIL;
            }
            e.printStackTrace();
        }
        return result;
    }

    public int updateUser(Customer customer) throws IOException {

        int result = StatusHandler.ERR_DB_PROC;

        try {
            PreparedStatement update = con.prepareStatement("update customer set fName=? ,lName=? ,phone=? ,email=? ,address=? where id=?");

            update.setString(1, customer.getFName());
            System.out.println("fname is" + customer.getFName());
            update.setString(2, customer.getLName());
            update.setString(3, customer.getPhone());
            update.setString(4, customer.getEmail());
            update.setString(5, customer.getAddress());

            update.setInt(6, customer.getId());

            if (update.executeUpdate() != 0) {
                result = StatusHandler.SUCCESS;
            }

        } catch (SQLException e) {
            if (e instanceof com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException) {
                result = StatusHandler.ERR_SIGNUP_EMAIL;
            }
            e.printStackTrace();
        }
        System.out.println("update statement" + result);
        return result;
    }

    public int updateUserPhoto(Customer customer, Part part) {
        int result = StatusHandler.ERR_DB_PROC;
        try {

            PreparedStatement pr = con.prepareStatement("update customer set image=? where id=? ");
            InputStream is = part.getInputStream();
            pr.setBinaryStream(1, is, (int) part.getSize());
            pr.setInt(2, customer.getId());
            if (pr.executeUpdate() != 0) {
                result = StatusHandler.SUCCESS;
            }
            System.out.println("result inside updatefunction" + result);

        } catch (SQLException ex) {
            ex.printStackTrace();

        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public Cards getCard(String serial) {
        try {
            PreparedStatement pr = con.prepareStatement("select * from cards where serial=?");
            pr.setString(1, serial);
            ResultSet rs = pr.executeQuery();
            if (rs.next()) {
                Cards card = new Cards();
                card.setAmount(rs.getDouble("amount"));
                card.setCardId(rs.getInt("cardId"));
                card.setSerial(rs.getString("serial"));

                return card;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public int updateUserCash(Customer customer, double cash) {
        int result = StatusHandler.ERR_DB_PROC;
        try {
            PreparedStatement pr = con.prepareStatement("update customer set cash=? where id=?");
            pr.setDouble(1, cash);
            pr.setInt(2, customer.getId());
            if (pr.executeUpdate() != 0) {
                result = StatusHandler.SUCCESS;
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return result;
    }

    public void deleteCard(String serial) {
        try {
            PreparedStatement pr = con.prepareStatement("delete from cards where serial=?");
            pr.setString(1, serial);
            pr.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Product> search(String productName) {
        ArrayList<Product> products = null;
        try {
            products = new ArrayList<>();

            String query = "select * from product where name like '%" + productName + "%'";
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt(1));
                product.setName(rs.getString("name"));
                product.setDesc(rs.getString("desc"));
                Blob blob = rs.getBlob("image");
                product.setImage(blob.getBytes(1, (int) blob.length()));
                product.setSerialNumber(rs.getString("serialNumber"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPrice(rs.getDouble("price"));

                products.add(product);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return products;
    }
	//End of Ashour Addition -------------------------

    //Added  by Hatem Al-Amir
   public int sigIn(String email, String password)
	{
		try{
			PreparedStatement stmnt = con.prepareStatement("select  password from customer where email=(?);");
			
			stmnt.setString(1, email);
			
			ResultSet rs = stmnt.executeQuery();
			
			if(rs.next())
			{
				String passwd = rs.getString("password");
				
				if(passwd != null && passwd.equals(passwd))
					return StatusHandler.SUCCESS;
				return StatusHandler.ERR_LOGIN_PASSWD;
			}

			return StatusHandler.ERR_LOGIN_EMAIL;
		} catch(SQLException ex)
		{
			ex.printStackTrace();
			return StatusHandler.ERR_DB_CONN;
		}
	}
	
	public Customer getCustomer(String email) throws SQLException
	{
		try{
			PreparedStatement stmnt = con.prepareStatement("select  * from customer where email=(?);");
			
			stmnt.setString(1, email);
			
			ResultSet rs = stmnt.executeQuery();
			
			if(rs.next())
			{
				Customer customer = new Customer();
				
				customer.setId(rs.getInt("id"));
				customer.setFName(rs.getString("fName"));
				customer.setLName(rs.getString("lName"));
				customer.setEmail(rs.getString("email"));
				Blob blob = rs.getBlob("image");
				customer.setImage(blob.getBytes(1, (int)blob.length()));
				customer.setPhone(rs.getString("phone"));
				customer.setPassword(rs.getString("password"));
				customer.setCash(rs.getDouble("cash"));
				customer.setBirthdate(rs.getString("birthdate"));
				customer.setJob(rs.getString("job"));
				customer.setAddress(rs.getString("address"));
				customer.setInterest(rs.getString("interest"));
				
				return customer;
			}
			return null;
		} catch(SQLException ex)
		{
			ex.printStackTrace();
			return null;
		}
	}
	
	public Product getProductById(int prodId) throws SQLException
	{
		PreparedStatement statement = con.prepareStatement("select  * from product where productId=(?);");
		statement.setInt(1, prodId);
		
		ResultSet rs = statement.executeQuery();
		
		if(rs.next())
		{
			Product product = new Product();
			product.setProductId(rs.getInt("productId"));
			product.setName(rs.getString("name"));
			product.setDesc(rs.getString("desc"));
			Blob img = rs.getBlob("image");
			if(img != null)
				product.setImage(img.getBytes(1, (int)img.length()));
			product.setSerialNumber(rs.getString("serialNumber"));
			product.setPrice(rs.getDouble("price"));
			product.setQuantity(rs.getInt("quantity"));
			return product;
		}
		
		return null;
	}
	
	public Product getProductByCategory(String category, int index) throws SQLException
	{
		if(index >= 0)
		{
			
			if(category.equals("latest"))
			{
				PreparedStatement statement = con.prepareStatement("select * from product where quantity > (?);");
				statement.setInt(1, 0);
				
				ResultSet rs = statement.executeQuery();
				
				rs.afterLast();
				while(rs.previous())
				{
					if(index == 0)
					{
						Product product = new Product();
						product.setProductId(rs.getInt("productId"));
						product.setName(rs.getString("name"));
						product.setDesc(rs.getString("desc"));
						Blob img = rs.getBlob("image");
						if(img != null)
							product.setImage(img.getBytes(1, (int)img.length()));
						product.setSerialNumber(rs.getString("serialNumber"));
						product.setPrice(rs.getDouble("price"));
						product.setQuantity(rs.getInt("quantity"));
						return product;
					}
					else if(index > 0)
						index--;
					else
						break;
				}
			}
			else if(category.equals("sample"))
			{
				PreparedStatement statement = con.prepareStatement("select * from product where quantity > (?);");
				statement.setInt(1, 0);
				
				ResultSet rs = statement.executeQuery();
				
				while(rs.next())
				{
					if(index == 0)
					{
						Product product = new Product();
						product.setProductId(rs.getInt("productId"));
						product.setName(rs.getString("name"));
						product.setDesc(rs.getString("desc"));
						Blob img = rs.getBlob("image");
						if(img != null)
							product.setImage(img.getBytes(1, (int)img.length()));
						product.setSerialNumber(rs.getString("serialNumber"));
						product.setPrice(rs.getDouble("price"));
						product.setQuantity(rs.getInt("quantity"));
						return product;
					}
					else if(index > 0)
						index--;
					else
						break;
				}
			}
		}
		return null;
	}
	
	public ArrayList<Product> getAllProducts(int customerId) throws SQLException
	{
		PreparedStatement ps = con.prepareStatement("select  * from product where quantity > (?) and productId not in (select productId from cart where customerId = (?));");
		
		ps.setInt(1, 0);
		ps.setInt(2, customerId);
		
		ResultSet productSet = ps.executeQuery();
		
		ArrayList<Product> products = new ArrayList<>();
		
		Product product;
		while(productSet.next())
		{
			product = new Product();
			
			product.setProductId(productSet.getInt("productId"));
			product.setName(productSet.getString("name"));
			product.setDesc(productSet.getString("desc"));
			product.setImage(productSet.getBytes("image"));
			product.setSerialNumber(productSet.getString("serialNumber"));
			product.setPrice(productSet.getDouble("price"));
			product.setQuantity(productSet.getInt("quantity"));
			
			products.add(product);
		}
		
		return products;
	}
	
	public boolean addToCart(int customerId, int prodId) throws SQLException
	{
		PreparedStatement productPs = con.prepareStatement("select  * from product where productId=(?);");
		productPs.setInt(1, prodId);
		ResultSet productSet = productPs.executeQuery();
		
		if(productSet.next())
		{
			PreparedStatement cartPs = con.prepareStatement("insert into cart(customerId, productId, time, quantity, bought)" + 
					"values(?,?,?,?,?);");
			Date now =  new Date();
			cartPs.setInt(1, customerId);
			cartPs.setInt(2, prodId);
			cartPs.setString(3, now.toString());
			cartPs.setInt(4, productSet.getInt("quantity"));
			cartPs.setString(5, "false");
			
			if(cartPs.executeUpdate() > 0)
				return true;
		}
		return false;
	}
    //End of Hatem Al-Amir additions
//start of shaaban 

    public Admin loginAdmin(Admin admin) throws SQLException {
        Admin newadmin = null;

        String sql = "select * from admin where email =? and password =?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, admin.getEmail());
        pst.setString(2, admin.getPassword());
        ResultSet rs = pst.executeQuery();
        while (rs.next()) {
            newadmin = new Admin();
            newadmin.setId(rs.getInt(1));
            newadmin.setUsername(rs.getString(2));
            newadmin.setEmail(rs.getString(3));
            newadmin.setPassword(rs.getString(4));

        }

        return newadmin;
    }

    public boolean signUp(Admin admin) throws SQLException {

        String sql = "insert into admin values()where email =?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, admin.getUsername());
        pst.setString(1, admin.getEmail());
        pst.setString(1, admin.getPassword());
        int i = pst.executeUpdate();
        if (i > 0) {
            return false;
        } else {
            return true;
        }
    }

    public boolean update(Admin admin) throws SQLException {

        String sql = "update admin set username =? , email=?, password= ? where id =?";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, admin.getUsername());
        pst.setString(2, admin.getEmail());
        pst.setString(3, admin.getPassword());
        pst.setInt(4, admin.getId());
        int i = pst.executeUpdate();
        if (i > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean insertAdmin(Admin admin) throws IOException {

        int result = 0;

        try {
            PreparedStatement insert = con.prepareStatement("insert into admin(username,email,password) values(?,?,?)");

            insert.setString(1, admin.getUsername());
            insert.setString(2, admin.getEmail());
            insert.setString(3, admin.getPassword());
            result = insert.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (result > 0) {
            return true;
        } else {
            return false;
        }

    }

    public boolean addProduct(Product product, Part productImage) throws SQLException, IOException {
        int result = 0;
        try {
            PreparedStatement insertProduct = con.prepareStatement("INSERT INTO product ( `name`, `desc`, `image` , `serialNumber`, `price`, `quantity`) VALUES  (?,?,?,?,?,?)");
            InputStream is = productImage.getInputStream();
            insertProduct.setString(1, product.getName());
            insertProduct.setString(2, product.getDesc());
            insertProduct.setBinaryStream(3, is, (int) productImage.getSize());
            insertProduct.setString(4, product.getSerialNumber());
            insertProduct.setDouble(5, product.getPrice());
            insertProduct.setInt(6, product.getQuantity());
            result = insertProduct.executeUpdate();

        } catch (SQLException e) {
            System.out.println("" + e.getMessage());
        }
        if (result > 0) {
            return true;
        } else {
            return false;
        }

    }

    public boolean deleteProduct(int id) throws SQLException {
        int flag = 0;

        PreparedStatement pst = con.prepareStatement("delete from product where productId=? ");
        pst.setInt(1, id);
        flag = pst.executeUpdate();

        if (flag > 0) {
            return true;
        }
        return false;
    }

    public boolean updateProduct(Product product, Part p) {
        int flag = 0;
        if (p != null) {
            try {
                InputStream is = p.getInputStream();
                PreparedStatement pst = con.prepareStatement("update product set `price`=? ,`desc`=?, `image`=? ,`quantity`=? where `productId`=? ");
                pst.setDouble(1, product.getPrice());
                pst.setString(2, product.getDesc());
                pst.setBinaryStream(3, is, (int) p.getSize());
                pst.setInt(4, product.getQuantity());
                pst.setInt(5, product.getProductId());

                flag = pst.executeUpdate();

            } catch (Exception e) {
                System.out.println("" + e.getMessage());
                return false;
            }
        } else {
            try {

                PreparedStatement pst = con.prepareStatement("update product set `price`=? ,`desc`=?`quantity`=? where `productId`=? ");
                pst.setDouble(1, product.getPrice());
                pst.setString(2, product.getDesc());

                pst.setInt(3, product.getQuantity());
                pst.setInt(4, product.getProductId());

                flag = pst.executeUpdate();

            } catch (Exception e) {
                System.out.println("" + e.getMessage());
                return false;
            }

        }

        if (flag > 0) {
            return true;
        }
        return false;
    }

    public Product searchProduct(int id) {
        Product product = null;
        try {
            PreparedStatement pst = con.prepareStatement("select * from product  where productId=? ");
            pst.setDouble(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                product = new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getBytes(4), rs.getString(5), rs.getDouble(6), rs.getInt(7));

            }
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return product;
    }

    public boolean deleteProductCart(int id) {
        int flag = 0;
        try {
            PreparedStatement pst = con.prepareStatement("delete from cart where productId=? ");
            pst.setInt(1, id);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            System.out.println("" + e.getMessage());
        }

        if (flag > 0) {
            return true;
        }
        return false;
    }

    public boolean changeCache(int customerId, Double sum) {
        int flag = 0;
        try {
            PreparedStatement pst = con.prepareStatement("update customer set cash =cash -? where id=? ");
            pst.setDouble(1, sum);
            pst.setInt(2, customerId);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            System.out.println("" + e.getMessage());
        }

        if (flag > 0) {
            return true;
        }
        return false;
    }

    public boolean changeQuantity(int productId, int quantity) {
        int flag = 0;
        try {
            PreparedStatement pst = con.prepareStatement("update product set quantity =quantity  -? where productId= ? ");
            pst.setInt(1, quantity);
            pst.setInt(2, productId);
            flag = pst.executeUpdate();

        } catch (SQLException e) {
            System.out.println("" + e.getMessage());
        }

        if (flag > 0) {
            return true;
        }
        return false;
    }

    public boolean changeStatus(int customerId, int productId, int qunatity) {
        int flag = 0;
        try {
            PreparedStatement pst = con.prepareStatement("update cart set bought='true' ,quantity= ? where productId=? and  customerId=? ");
            pst.setInt(1, qunatity);
            pst.setInt(2, productId);
            pst.setInt(3, customerId);

            flag = pst.executeUpdate();

        } catch (SQLException e) {
            System.out.println("" + e.getMessage());
        }

        if (flag > 0) {
            return true;
        }
        return false;
    }

    public boolean addCard(Cards card) throws SQLException, IOException {
        int result = 0;
        try {
            PreparedStatement insertCard = con.prepareStatement("INSERT INTO `cards`(`serial`, `amount`) VALUES (?,?)");

            insertCard.setString(1, card.getSerial());
            insertCard.setDouble(2, card.getAmount());

            result = insertCard.executeUpdate();
            System.out.println("result" + result);

        } catch (SQLException e) {
            System.out.println("" + e.getMessage());
        }
        if (result > 0) {
            return true;
        } else {
            return false;
        }

    }

    public ArrayList<Customer> getAllCustomers() {
        ArrayList<Customer> customer = null;
        try {
            customer = new ArrayList<>();

            String query = "select * from customer ";
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Customer custome = new Customer();
                custome.setId(rs.getInt(1));
                custome.setFName(rs.getString(2));
                custome.setLName(rs.getString(3));
                custome.setEmail(rs.getString(4));

                custome.setPhone(rs.getString(6));
                custome.setCash(rs.getDouble(8));
                custome.setBirthdate(rs.getString(9));
                custome.setJob(rs.getString(10));
                custome.setAddress(rs.getString(11));
                custome.setInterest(rs.getString(12));

                customer.add(custome);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return customer;
    }

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> products = null;
        try {
            products = new ArrayList<>();

            String query = "select * from product ";
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Product product = new Product();
                product.setProductId(rs.getInt(1));
                product.setName(rs.getString("name"));
                product.setDesc(rs.getString("desc"));
                Blob blob = rs.getBlob("image");
                product.setImage(blob.getBytes(1, (int) blob.length()));
                product.setSerialNumber(rs.getString("serialNumber"));
                product.setQuantity(rs.getInt("quantity"));
                product.setPrice(rs.getDouble("price"));

                products.add(product);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return products;
    }

    public ArrayList<Cart> getAllProductFromCart() {
        ArrayList<Cart> cartList = null;
        try {
            cartList = new ArrayList<>();

            String query = "select * from cart where bought='true'";
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                Cart cart = new Cart();
                Customer customer = new Customer();
                customer.setId(rs.getInt(2));
                cart.setCustomer(customer);
                Product p=new Product();
                p.setProductId(rs.getInt(3));
                cart.setProduct(p);
                cart.setTime(rs.getString(4));
                cart.setQuantity(rs.getInt(5));
                cart.setBought(rs.getString(6));
                cartList.add(cart);

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return cartList;
    }

    public ArrayList<Cart> getallcart(int id) {
         ArrayList<Cart> cartList = null;
        try {
            cartList = new ArrayList<>();

            
          

            PreparedStatement pst = con.prepareStatement("select * from  cart where bought='false' and customerId = ?");
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                Customer customer = new Customer();
                customer.setId(rs.getInt(2));
                cart.setCustomer(customer);
                Product p=new Product();
                p.setProductId(rs.getInt(3));
                cart.setProduct(p);
                cart.setTime(rs.getString(4));
                cart.setQuantity(rs.getInt(5));
                cart.setBought(rs.getString(6));
                cartList.add(cart);

            }
        } catch (SQLException ex) {
            System.out.println(""+ex.getMessage());
        }

        return cartList;
}
    
    public static void main(String[] args) throws SQLException {
          DBConnection db = new DBConnection();
            ArrayList<Cart> list = new ArrayList<Cart>();
            ArrayList<Product> listO = new ArrayList<>();
           

           
           
            list = db.getallcart(13);
            

            for (Cart list1 : list) {
                Product x ;
                x = db.searchProduct(list1.getProduct().getProductId());
                listO.add(x);
                
            }
            for (Cart list1 : list) {
                for (Product listO1 : listO) {
                    if(list1.getProduct().getProductId()==listO1.getProductId())
                    {
                        System.out.println("access");
                    }
                    System.out.println("kdskdjksjd");
                }
            }
           
    }
}