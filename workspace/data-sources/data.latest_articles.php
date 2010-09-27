<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcelatest_articles extends Datasource{
		
		public $dsParamROOTELEMENT = 'latest-articles';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '3';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:date';
		public $dsParamSTARTPAGE = '1';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		public $dsParamINCLUDEDELEMENTS = array(
				'published',
				'title',
				'author',
				'body: formatted',
				'published-on'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'latest articles',
					 'author' => array(
							'name' => 'scott tesoriere',
							'website' => 'http://localhost/nichols',
							'email' => 'scott@tesoriere.com'),
					 'version' => '1.0',
					 'release-date' => '2010-09-27T17:50:22+00:00');	
		}
		
		public function getSource(){
			return '3';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}			
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

