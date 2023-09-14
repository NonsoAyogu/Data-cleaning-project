SELECT *
FROM nashvilehousing 
SELECT *
FROM nashvilehousing 
order by uniqueid

SELECT *
FROM nashvilehousing b
JOIN Nashvilehousing c
on b.parcelid = c.parcelid

SELECT *
FROM nashvilehousing b
JOIN Nashvilehousing c
on b.parcelid = c.parcelid
and b.uniqueid <> c.uniqueid
WHERE b.propertyaddress is null

SELECT b.parcelid,b.propertyaddress, c.parcelid, c.propertyaddress, ISNULL(b.propertyaddress, c.propertyaddress)
FROM nashvilehousing b
JOIN Nashvilehousing c
ON b.parcelid = c.parcelid
AND b.uniqueid <> c.uniqueid
WHERE b.propertyaddress is null

UPDATE b
SET b.propertyaddress = ISNULL(b.propertyaddress, c.propertyaddress)
FROM nashvilehousing b
JOIN Nashvilehousing c
ON b.parcelid = c.parcelid
AND b.uniqueid <> c.uniqueid
WHERE b.propertyaddress is null


SELECT b.parcelid,b.propertyaddress, b.uniqueid, c.parcelid, c.propertyaddress, c.uniqueid
FROM nashvilehousing b
JOIN Nashvilehousing c
ON b.parcelid = c.parcelid
AND b.uniqueid <> c.uniqueid

SELECT 
SUBSTRING(propertyaddress,1, CHARINDEX(',', PropertyAddress)-1) AS address,
SUBSTRING(propertyaddress, CHARINDEX(',', PropertyAddress)+1, LEN(Propertyaddress)) AS City
FROM nashvilehousing


SELECT 
SUBSTRING(propertyaddress,1, CHARINDEX(',', PropertyAddress)-1) AS address,
 CHARINDEX(',', PropertyAddress)
FROM nashvilehousing


ALTER
TABLE Nashvilehousing
add updatedpropertyaddress varchar(255)
ALTER
TABLE Nashvilehousing
ADD city nvarchar(255)


UPDATE
Nashvilehousing
SET updatedpropertyaddress = SUBSTRING(propertyaddress,1, CHARINDEX(',', PropertyAddress)-1)

SELECT updatedpropertyaddress
FROM nashvilehousing


UPDATE
Nashvilehousing
SET updatedpropertyaddress = SUBSTRING(propertyaddress,1, CHARINDEX(',', PropertyAddress)-1)


ALTER
TABLE Nashvilehousing
DROP COLUMN city 

ALTER
TABLE Nashvilehousing
ADD Propertycity nvarchar(250)

UPDATE
Nashvilehousing
SET PropertyCity = SUBSTRING(propertyaddress, CHARINDEX(',', PropertyAddress)+1, LEN(Propertyaddress))

UPDATE
Nashvilehousing
SET updatedpropertyaddress = SUBSTRING(propertyaddress,1, CHARINDEX(',', PropertyAddress)-1)


SELECT uniqueid, propertyaddress, propertycity
FROM nashvilehousing


SELECT DISTINCT propertycity
FROM Nashvilehousing


SELECT propertyaddress, updatedpropertyaddress, propertycity
FROM Nashvilehousing


DROP TABLE Nashvillehousing


SELECT parsename (owneraddress, 1)
FROM Nashvilehousing

SELECT owneraddress
FROM Nashvilehousing
WHERE owneraddress IS NOT NULL


SELECT PARSENAME (REPLACE (owneraddress,',', '.'), 3),
PARSENAME (REPLACE (owneraddress,',', '.'), 2),
PARSENAME (REPLACE (owneraddress,',', '.'), 1)
FROM Nashvilehousing


ALTER
TABLE Nashvilehousing
ADD owneraddress1 nvarchar(255)
ALTER
TABLE Nashvilehousing
ADD ownercity nvarchar(255)
ALTER
TABLE Nashvilehousing
ADD ownerstate nvarchar(255)

UPDATE
Nashvilehousing
SET owneraddress1 = PARSENAME (REPLACE (owneraddress,',', '.'), 3) 

UPDATE
Nashvilehousing
SET  ownercity = PARSENAME (REPLACE (owneraddress,',', '.'), 2)

UPDATE
Nashvilehousing
SET ownerstate =  PARSENAME (REPLACE (owneraddress,',', '.'), 1)

SELECT *
FROM Nashvilehousing

SELECT DISTINCT soldasvacant, COUNT(soldasvacant)
FROM Nashvilehousing
GROUP BY soldasvacant
ORDER BY 2


SELECT soldasvacant,
(CASE
WHEN soldasvacant ='y' THEN 'Yes'
WHEN soldasvacant = 'N' THEN 'No'
ELSE soldasvacant END)
FROM Nashvilehousing

UPDATE Nashvilehousing
SET soldasvacant = (CASE
WHEN soldasvacant ='y' THEN 'Yes'
WHEN soldasvacant = 'N' THEN 'No'
ELSE soldasvacant END)

SELECT * FROM Nashvilehousing

WITH rownumberCTE AS(
SELECT *, 
	ROW_NUMBER () OVER 
		(PARTITION BY parcelid,	landuse, propertyaddress, saledate,	saleprice, legalreference ORDER BY uniqueid) rownumber
FROM Nashvilehousing
)

SELECT * 
FROM rownumberCTE
WHERE rownumber > 1
ORDER BY rownumber



WITH rownumberCTE AS(
SELECT *, 
	ROW_NUMBER () OVER 
		(PARTITION BY parcelid,	landuse, propertyaddress, saledate,	saleprice, legalreference ORDER BY uniqueid) rownumber
FROM Nashvilehousing
)

DELETE
FROM rownumberCTE
WHERE rownumber > 1
--ORDER BY rownumber


WITH rownumberCTE AS(
SELECT *, 
	ROW_NUMBER () OVER 
		(PARTITION BY parcelid,	landuse, propertyaddress, saledate,	saleprice, legalreference ORDER BY uniqueid) rownumber
FROM Nashvilehousing
)

SELECT * 
FROM rownumberCTE
WHERE rownumber > 1
ORDER BY rownumber

SELECT *
FROM Nashvilehousing

ALTER TABLE Nashvilehousing
DROP COLUMN owneraddress, taxdistrict, propertyaddress


ALTER TABLE Nashvilehousing
DROP COLUMN saledate