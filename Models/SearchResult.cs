namespace GooruuSearchApp.Models
{
    public class SearchResult
    {
        public string Id { get; set; } = Guid.NewGuid().ToString(); // เพิ่ม ID
        public string Title { get; set; } = string.Empty;
        public string Url { get; set; } = string.Empty;
        public string Snippet { get; set; } = string.Empty;
        public string Date { get; set; } = string.Empty;
        public string FullContent { get; set; } = string.Empty; // เพิ่มเนื้อหาเต็ม
        public string ImageUrl { get; set; } = "https://via.placeholder.com/800x400?text=Crime+Scene+Photo"; // รูปจำลอง
    }
}
