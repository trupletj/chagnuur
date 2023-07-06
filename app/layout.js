import "./globals.css";
import {
  Inter,
  M_PLUS_Rounded_1c,
  Comfortaa,
  Roboto,
  Nunito,
} from "next/font/google";

const inter = Inter({
  subsets: ["latin"],
});

const nunito = Nunito({
  subsets: ["cyrillic"],
  weight: ["200", "300", "400", "500", "600", "700", "800"],
});

const comfortaa = Comfortaa({
  subsets: ["cyrillic"],
  weight: ["300", "400", "500", "700"],
});

export const metadata = {
  title: "Chagnuur",
  description: "Эмч, эмнэлгийн мэргэжилтнүүдийн давтан сургалтын нэгдсэн сайт",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body className={nunito.className}>{children}</body>
    </html>
  );
}
