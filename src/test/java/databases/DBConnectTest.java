package databases;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class DBConnectTest {
    /**
     * Test thu ket noi data base
     */

    @Test
    void getConnection() {
        DBConnect dbConnect = new DBConnect();
        assertNotNull(dbConnect.getConnection());
    }
}