import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

public class text {
    public static void main(String[] args) {
        // 定义文件名
        String fileName = "shopping_3.sql";

        // 使用try-with-resources语句自动关闭资源
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(fileName))) {
            // i 商品id
            for (int i = 1; i <= 45; i++) {
                // j 评价次数
                for (int j = 1; j <= 34; j++) {
                    String sql = String.format(
                            "INSERT INTO reviews (ProductID, UserID, Rating, Comment, ReviewTime)\n" +
                                    "VALUES (%d, 1, %d, '评价%d', '2024-12-09 08:30:25');\n",
                            i, (int) (Math.random() * 5) + 1, j
                    );
                    writer.write(sql);
                }
            }
            System.out.println("SQL插入语句已成功写入文件: " + fileName);
        } catch (IOException e) {
            System.err.println("发生错误，无法写入文件: " + e.getMessage());
        }
    }
}
