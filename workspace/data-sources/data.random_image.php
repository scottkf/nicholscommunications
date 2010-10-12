<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcerandom_image extends Datasource{
		
		public $dsParamROOTELEMENT = 'random-image';
		public $dsParamORDER = 'random';
		public $dsParamLIMIT = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		
		public $dsParamFILTERS = array(
				'15' => '{$current-page}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'name'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Random Image',
					 'author' => array(
							'name' => 'Scott Tesoriere',
							'website' => 'http://ncomm.dyndns.org/nichols',
							'email' => 'scott@tesoriere.com'),
					 'version' => '1.0',
					 'release-date' => '2010-10-12T12:04:04+00:00');	
		}
		
		public function getSource(){
			return '4';
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

