package edu.ben.data;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Iterator;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import edu.ben.dao.CategoryDao;
import edu.ben.dao.ProductDao;
import edu.ben.model.Category;
import edu.ben.model.Product;

public class ImportData {

	public static void main(String[] args) throws IOException, SQLException {
		dataImport();
	}

	public static void dataImport() throws IOException, SQLException {

		CategoryDao cDao = new CategoryDao();

		ProductDao pDao = new ProductDao();

		/* Open the excel file */
		File fileName = new File("EcommerceData.xlsx");
		FileInputStream fileIS = new FileInputStream(fileName);

		/* Finds the workbook instance of the excel file */
		XSSFWorkbook wb = new XSSFWorkbook(fileIS);

		/*
		 * Retrieves the sheet containing student information from the excel
		 * file
		 */
		XSSFSheet studentSheet = wb.getSheetAt(0);

		/*
		 * Retrieves the sheet containing major information from the excel file
		 */
		XSSFSheet majorSheet = wb.getSheetAt(0);

		/* Create iterator for the student sheet */
		Iterator<Row> rowIterator = studentSheet.iterator();

		/* Skips the column declaration row */
		Row row = rowIterator.next();

		// Traversing over each row of XLSX file
		while (rowIterator.hasNext()) {
			row = rowIterator.next();
			Cell cell = row.getCell(9);

			switch (cell.getCellType()) {
			case Cell.CELL_TYPE_STRING:
				String cat = cell.getStringCellValue();
				cDao.insertCategory(new Category(cat));
				break;

			default:

			}

		}
		cDao.closeConnection();
		/* Creates iterator for the major sheet */
		rowIterator = majorSheet.iterator();

		/* Skips the column declaration row */
		row = rowIterator.next();

		// Traversing over each row of XLSX file
		while (rowIterator.hasNext()) {
			row = rowIterator.next();
			Cell nameCell = row.getCell(0);
			Cell pathCell = row.getCell(2);
			Cell categoryCell = row.getCell(9);
			switch (nameCell.getCellType()) {
			case Cell.CELL_TYPE_STRING:
				String name = nameCell.getStringCellValue();
				String path = pathCell.getStringCellValue();
				String cat = categoryCell.getStringCellValue();
				pDao.insertProduct(new Product(name, "", cat, path));
				break;
			
			default:

			}

		}

		wb.close();
	}
}
