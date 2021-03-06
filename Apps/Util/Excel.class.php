<?php
/**
 * 导出数据到Excel文件
 * 付志飞  ysfzf@hotmail.com  2015/08/31
 */
namespace Util;
class Excel{
	private $e;
	private $s;	
	private $ver='20150831';
	private $sheetsum=1;	
	function __construct($sheetIndex=0){
		vendor('Excel.PHPExcel');		
		$this->e=new \PHPExcel();
		$this->e->getProperties ()->setCreator ( "ysfzf@hotmail.com" )
				->setLastModifiedBy ( "ysfzf@hotmail.com" )
				->setTitle ( "EXCEL 2003  Document" )
				->setSubject ( "EXCEL 2003  Document" )
				->setDescription ( "write excel {$this->ver},PHPExcel 1.8.0" )
				->setKeywords ( "office 2003 openxml php" )
				->setCategory ( "Statement of Account" );
		$this->e->setActiveSheetIndex ( $sheetIndex );
		$this->s = $this->e->getActiveSheet ();
		$this->sheetsum=$sheetIndex+1;
	}
	
	/**
	 * 在excel文件中添加一个表
	 */
	function addSheet(){
		
		$newsheet = new \PHPExcel_Worksheet($this->e); 
		$this->e->addSheet($newsheet); 
        $this->e->setActiveSheetIndex($this->sheetsum); 
		$this->s = $this->e->getActiveSheet ();
		$this->sheetsum++;
	}
	
	/**
	 * 设置宽度
	 * @param string $col  单元格名
	 * @param integer $width  宽度
	 */
	function setWidth($col,$width){
		$this->s->getColumnDimension ( $col )->setWidth ( $width );

	}

	/**
	 * 合并几个单元格
	 * @param string  $cell1 起始单元格
	 * @param string  $cell2 结否单元格
	 * @param array  $style 样式数组
	 */
	function mergeCells($cell1,$cell2,$style){
		$this->s->mergeCells ( "{$cell1}:{$cell2}" );
		if($this->is_assoc($style)){
			$this->setStyle($cell1,$cell2,$style);
		} 
	}

	/**
	 * 冻结单元格
	 * @param string $col 单元格名
	 */
	function freezePane($col){
		$this->s->freezePane($col);

	}	

	/**
	 * 设置当前表的名称
	 * @param string $str
	 */
	function setTitle($str){
		$this->s->setTitle($str);

	}
	private function is_assoc($arr) {  
		return array_keys($arr) !== range(0, count($arr) - 1);  
	}  
	
	 //设置样式的私有方法
	private function setAllStyle($cell1,$cell2,$fontsize,$bold,$italic,$align,$color,$br,$fillrgb){
		$sty=$this->s->getstyle($cell1);
			//字体
		$font=$sty->getFont();
		$font->setSize($fontsize);
		$font->setBold($bold);
		$font->setItalic($italic);
		$font->getColor()->setARGB($color);
			//对齐方式
		$alig=$sty->getAlignment();		
		if ($align=="L"){
			$alig->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_LEFT);
		}elseif ($align=="R"){
			$alig->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_RIGHT);
		}else{
		    $alig->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
		}
		$alig->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        
		//var_dump($br);
		//边框
		if ($br){
		    
			$border=$sty->getBorders();
			$border->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
			$border->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
			$border->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
			$border->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
		}
		//填充颜色
		if($fillrgb){
			$fill=$sty->getfill();
			$fill->setFillType(\PHPExcel_Style_Fill::FILL_SOLID);
			$fill->getStartColor()->setARGB($fillrgb);
		}


		$pc=$cell1.":".$cell2;
		$this->s->duplicateStyle($sty,$pc);
	}
	
	/**
	 * 给二维数组排序
	 * @param array $arr  数组
	 * @param string $keys  按哪个下标排序
	 * @param string $type  排序方式
	 * @return array  返回一个新的数组
	 */
	function array_sort($arr,$keys,$type='asc'){ 
			$keysvalue = $new_array = array();
			foreach ($arr as $k=>$v){
				$keysvalue[$k] = $v[$keys];
			}
			if($type == 'asc'){
				asort($keysvalue);
			}else{
				arsort($keysvalue);
			}
			reset($keysvalue);
			foreach ($keysvalue as $k=>$v){
				$new_array[$k] = $arr[$k];
			}
			return $new_array; 
	} 
	
	/**
	 * 保存文件
	 * @param string  $file  文件路径和名称
	 */
	function save($file){
		ob_end_clean();
		$objWriter = \PHPExcel_IOFactory::createWriter($this->e, 'Excel5');
		$objWriter->save($file);
	}

	/**
	 * 导出excel文件，供下载
	 * @param string $file  文件名
	 */
	function output($file){
		ob_end_clean();
		$file = iconv("utf-8", "gb2312", $file);
		header ( 'Content-Type: application/vnd.ms-excel' );
		header ( 'Content-Disposition: attachment;filename="'.$file.'"' );
		header ( 'Cache-Control: max-age=0' );
		$objWriter = \PHPExcel_IOFactory::createWriter ( $this->e, 'Excel5' );
		$objWriter->save ( 'php://output' );
		exit ();
	}
	
	/**
	 * 给一个单元格写入数据
	 * @param string $cell  单元格地址
	 * @param strgin  $value  要写入的值
	 * @param array|false $style  样式数组
	 */
	function setValue($cell,$value,$style=false){
		$this->s->setCellValue ($cell,$value);
		if($style){
			$this->setStyle($cell,$cell,$style);			 
		}
	}
	
	/**
	 * 批量写入数据
	 * @param string $cell 起始单元格
	 * @param array  $arr  起始数组
	 * @param array|false $style   样式数组fontsize,bold,italic,center,color,border,bgcolor
	 * @return string  返回最后的下一行号
	 */
	function setData($cell,$arr,$style=false){
		if($arr){
			$col=substr($cell,0,1);
			$col=ord($col);
			$row=substr($cell,1);
			$pc='';
			foreach($arr as $r){
				$r=array_values($r);
				for($i=0;$i<count($r);$i++){
					$pc=chr($col+$i).$row;
					$this->setValue($pc,$r[$i],false);					
				}
				
				$row++;
			}
			if($style){				 
				$this->setStyle($cell,$pc,$style);
				 	
			}
			
		}
		if($row==""){
			return '10';
		}
		return $row;
	}
	
	/**
	 * 设置样式 
	 * @param string $cell1  起始单元格
	 * @param string $cell2 结束单元格
	 * @param array $style 样式数组fontsize,bold,italic,align,color,border,bgcolor
	 * 
	 */
	function setStyle($cell1,$cell2,$style){
		if(is_array($style)){
			$fontsize=isset($style['fontsize'])?$style['fontsize']:12;
			$bold=isset($style['bold'])?$style['bold']:false;
			$italic=isset($style['italic'])?$style['italic']:false;
			$center=isset($style['align'])?$style['align']:'C';
			$color=isset($style['color'])?$style['color']:0;
			$border=isset($style['border'])?$style['border']:false;
			$bgcolor=isset($style['bgcolor'])?$style['bgcolor']:false;	
			 
			$center=strtoupper($center);
			$this->setAllStyle($cell1,$cell2,$fontsize,$bold,$italic,$center,$color,$border,$bgcolor);
		}
		
		
	}
	
	
}
