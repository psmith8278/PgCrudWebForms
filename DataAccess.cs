using Npgsql;
using System;
using System.Data;
using System.Collections.Generic;

namespace PgCrudWebForms
{
    public class DataAccess
    {
        private string connString = System.Configuration.ConfigurationManager.ConnectionStrings["PgConnection"].ConnectionString;

        // Customers CRUD (all via SPs)
        public List<Customer> GetCustomers()
        {
            var customers = new List<Customer>();
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT * FROM get_customers();", conn))
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        customers.Add(new Customer
                        {
                            CustomerId = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            Email = reader.GetString(2)
                        });
                    }
                }
            }
            return customers;
        }

        public void InsertCustomer(string name, string email)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT insert_customer(@name, @email);", conn))
                {
                    cmd.Parameters.AddWithValue("name", name);
                    cmd.Parameters.AddWithValue("email", email);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateCustomer(int customerId, string name, string email)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT update_customer(@id, @name, @email);", conn))
                {
                    cmd.Parameters.AddWithValue("id", customerId);
                    cmd.Parameters.AddWithValue("name", name);
                    cmd.Parameters.AddWithValue("email", email);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void DeleteCustomer(int customerId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT delete_customer(@id);", conn))
                {
                    cmd.Parameters.AddWithValue("id", customerId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Orders CRUD (all via SPs)
        public List<Order> GetOrders()
        {
            var orders = new List<Order>();
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT * FROM get_orders();", conn))
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        orders.Add(new Order
                        {
                            OrderId = reader.GetInt32(0),
                            CustomerId = reader.GetInt32(1),
                            OrderDate = reader.GetDateTime(2)
                        });
                    }
                }
            }
            return orders;
        }

        public Order GetOrderById(int orderId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT * FROM get_order_by_id(@id);", conn))
                {
                    cmd.Parameters.AddWithValue("id", orderId);
                    using (var reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new Order
                            {
                                OrderId = reader.GetInt32(0),
                                CustomerId = reader.GetInt32(1),
                                OrderDate = reader.GetDateTime(2)
                            };
                        }
                    }
                }
            }
            return null;
        }

        public void InsertOrder(int customerId, DateTime orderDate)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT insert_order(@customerid, @orderdate);", conn))
                {
                    cmd.Parameters.AddWithValue("customerid", customerId);
                    cmd.Parameters.AddWithValue("orderdate", orderDate);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateOrder(int orderId, int customerId, DateTime orderDate)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT update_order(@id, @customerid, @orderdate);", conn))
                {
                    cmd.Parameters.AddWithValue("id", orderId);
                    cmd.Parameters.AddWithValue("customerid", customerId);
                    cmd.Parameters.AddWithValue("orderdate", orderDate);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void DeleteOrder(int orderId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT delete_order(@id);", conn))
                {
                    cmd.Parameters.AddWithValue("id", orderId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // Products CRUD (all via SPs)
        public List<Product> GetProducts()
        {
            var products = new List<Product>();
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT * FROM get_products();", conn))
                using (var reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        products.Add(new Product
                        {
                            ProductId = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            Price = reader.GetDecimal(2)
                        });
                    }
                }
            }
            return products;
        }

        public void InsertProduct(string name, decimal price)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT insert_product(@name, @price);", conn))
                {
                    cmd.Parameters.AddWithValue("name", name);
                    cmd.Parameters.AddWithValue("price", price);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateProduct(int productId, string name, decimal price)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT update_product(@id, @name, @price);", conn))
                {
                    cmd.Parameters.AddWithValue("id", productId);
                    cmd.Parameters.AddWithValue("name", name);
                    cmd.Parameters.AddWithValue("price", price);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void DeleteProduct(int productId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT delete_product(@id);", conn))
                {
                    cmd.Parameters.AddWithValue("id", productId);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        // OrderItems CRUD (all via SPs)
        public List<OrderItem> GetOrderItems(int orderId)
        {
            var orderItems = new List<OrderItem>();
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT * FROM get_orderitems_by_order(@orderid);", conn))
                {
                    cmd.Parameters.AddWithValue("orderid", orderId);
                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            orderItems.Add(new OrderItem
                            {
                                OrderItemId = reader.GetInt32(0),
                                OrderId = reader.GetInt32(1),
                                ProductId = reader.GetInt32(2),
                                Quantity = reader.GetInt32(3),
                                UnitPrice = reader.GetDecimal(4)
                            });
                        }
                    }
                }
            }
            return orderItems;
        }

        public void InsertOrderItem(int orderId, int productId, int quantity, decimal unitPrice)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT insert_orderitem(@orderid, @productid, @quantity, @unitprice);", conn))
                {
                    cmd.Parameters.AddWithValue("orderid", orderId);
                    cmd.Parameters.AddWithValue("productid", productId);
                    cmd.Parameters.AddWithValue("quantity", quantity);
                    cmd.Parameters.AddWithValue("unitprice", unitPrice);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void UpdateOrderItem(int orderItemId, int orderId, int productId, int quantity, decimal unitPrice)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT update_orderitem(@id, @orderid, @productid, @quantity, @unitprice);", conn))
                {
                    cmd.Parameters.AddWithValue("id", orderItemId);
                    cmd.Parameters.AddWithValue("orderid", orderId);
                    cmd.Parameters.AddWithValue("productid", productId);
                    cmd.Parameters.AddWithValue("quantity", quantity);
                    cmd.Parameters.AddWithValue("unitprice", unitPrice);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        public void DeleteOrderItem(int orderItemId)
        {
            using (var conn = new NpgsqlConnection(connString))
            {
                conn.Open();
                using (var cmd = new NpgsqlCommand("SELECT delete_orderitem(@id);", conn))
                {
                    cmd.Parameters.AddWithValue("id", orderItemId);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }

    // Data models
    public class Customer
    {
        public int CustomerId { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
    }

    public class Order
    {
        public int OrderId { get; set; }
        public int CustomerId { get; set; }
        public DateTime OrderDate { get; set; }
    }

    public class Product
    {
        public int ProductId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
    }

    public class OrderItem
    {
        public int OrderItemId { get; set; }
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }
    }
}
